class ReviewsController < ApplicationController
  before_action :authenticate, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @review = Review.new
    @reviews = Review.all
    @users = current_user.users_to_follow
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = current_user.reviews.new(review_params)

    if @review.save
      redirect_to root_path, notice: 'Review created successfuly'
    else
      redirect_to root_path
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
      params.require(:review).permit(:text)
    end
end
