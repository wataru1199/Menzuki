class Admin::CommentsController < ApplicationController
  
   before_action :authenticate_admin!

  def destroy
   Comment.find(params[:id]).destroy
   redirect_to admin_review_path(params[:review_id])
  end

end
