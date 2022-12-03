class Public::CommentsController < ApplicationController

before_action :authenticate_member!

  def create
   @review = Review.find(params[:review_id]) #URLから現在のreviewレコード取得
   @comment = current_member.comments.new(comment_params) #現在のmemberに紐づくcommentレコードを作成
   @comment.comment_score = Language.get_data(comment_params[:comment_cont])
   @comment.review_id = @review.id #レコードのreview_idには上記のreview_idを入れる
   @comment.save
   # redirect_to review_path(review)
  end

  def destroy
   @review = Review.find(params[:review_id])
   Comment.find(params[:id]).destroy
   # redirect_to review_path(params[:review_id])
  end

  private

  def comment_params
   params.require(:comment).permit(:comment_cont)
  end


end
