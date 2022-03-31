class UserMailer < ApplicationMailer

  def send_login_link(user)
    @user = user

    mail to: @user.email
  end
end
