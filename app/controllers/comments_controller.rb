class CommentsController < ApplicationController
  before_action :authenticate

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to @comment.review, notice: 'You commented on the review'
    else
      redirect_to @comment.review, alert: @comment.errors.full_messages.first
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.review, notice: 'Comment deleted successfuly'
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :review_id)
  end
end
