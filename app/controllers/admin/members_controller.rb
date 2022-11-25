class Admin::MembersController < ApplicationController

   before_action :authenticate_admin!

  def index
   @members= Member.all
  end

  def show
    @member= specific_member
    @reviews= @member.reviews.all
  end

  def update
   @member= specific_member
   if @member.update(category_params)
      flash[:success]= "会員ステータスを更新しました"
      redirect_to admin_members_path
   end
  end

  private

  def category_params
   params.require(:member).permit(:is_deleted)
  end

  def specific_member
    Member.find(params[:id])
  end

end
