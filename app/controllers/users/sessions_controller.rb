class Users::SessionsController < Devise::SessionsController
  
  def guest_sign_in
    user = Member.guest
    sign_in user
    redirect_to member_path(user), notice: 'guestuserでログインしました。'
  end
  
end