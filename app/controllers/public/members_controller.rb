class Public::MembersController < ApplicationController
  layout "public"

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
      @member= Member.find(params[:id])
      render :edit
    end
  end

  private

  def member_params
   params.require(:member).permit(:name, :email, :introduction)
  end

end
