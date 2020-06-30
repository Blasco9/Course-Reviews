# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate, only: %i[index show edit update destroy]
  before_action :set_review, only: %i[edit update destroy]

  def index
    @review = Review.new
    @reviews = Review.all.includes(author: { photo_attachment: :blob })
    @users = current_user.users_to_follow.includes(photo_attachment: :blob)
    @courses = Course.all
  end

  def show
    @review = Review.includes(:comments).find(params[:id])
  end

  def edit; end

  def create
    @review = current_user.reviews.new(review_params)

    if @review.save
      redirect_to root_path, notice: 'Review created successfuly'
    else
      redirect_to root_path, alert: @review.errors.full_messages
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review updated successfuly'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path, notice: 'Review deleted successfuly'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:text, :course_id)
  end
end
