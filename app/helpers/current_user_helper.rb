module CurrentUserHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def admin_logged_in?
    logged_in? && current_user.admin?
  end

end
