class Public::MembersController < ApplicationController

before_action :authenticate_member!

  def show
    @member= Member.find(params[:id])
    @reviews= Review.all.where(member_id: @member.id)
  end

  def edit
    @member= Member.find(params[:id])
  end

  def update
    @member= Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path(@member.id)
    else
      render :edit
      @member= Member.find(params[:id])
    end
  end

  private

  def member_params
   params.require(:member).permit(:name, :email, :introduction, :profile_image)
  end

end
