module ApplicationHelper
  def user_signed_in?
    !User.find_by(email: session[:email]).nil?
  end

  def current_user
    User.find_by(email: session[:email])
  end
end
