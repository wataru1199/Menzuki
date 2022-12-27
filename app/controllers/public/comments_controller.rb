class Public::CommentsController < ApplicationController

before_action :authenticate_member!

  def create
   @review = Review.find(params[:review_id])
   @comment = current_member.comments.new(comment_params)
   @comment.comment_score = Language.get_data(comment_params[:comment_cont])
   @comment.review_id = @review.id
   @comment.save
  end

  def destroy
   @review = Review.find(params[:review_id])
   Comment.find(params[:id]).destroy
  end

  private

  def comment_params
   params.require(:comment).permit(:comment_cont)
  end


end
