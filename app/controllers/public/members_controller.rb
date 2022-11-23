class Public::MembersController < ApplicationController

before_action :authenticate_member!
before_action :ensure_guest_user, only: [:edit]

  def show
    @member= Member.find(params[:id])
    @reviews= Review.all.where(member_id: @member.id)
    @comment = Comment.new
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

  def status
    @member= Member.find(params[:id])
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def member_params
   params.require(:member).permit(:name, :email, :introduction, :profile_image, :is_deleted)
  end

  def ensure_guest_user
    @user = Member.find(params[:id])
    if @user.name == "guestuser"
      redirect_to member_path(current_member) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end

