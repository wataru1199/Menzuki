class Admin::MembersController < ApplicationController
  
   before_action :authenticate_admin!

  def index
   @members= Member.all
  end

  def show
    @member= Member.find(params[:id])
    @reviews= @member.reviews.all
  end

  def update
   @member= Member.find(params[:id])
   if @member.update(category_params)
      flash[:success]= "会員ステータスを更新しました"
      redirect_to admin_member_path(@member.id)
   end
  end

  private
  
  def category_params
   params.require(:member).permit(:is_deleted)
  end

end
