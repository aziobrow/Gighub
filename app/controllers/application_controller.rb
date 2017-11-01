class ApplicationController < ActionController::Base
  include CurrentUserHelper

  protect_from_forgery with: :exception
  before_action :set_cart

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def require_login
    redirect_to login_path unless logged_in?
  end

end
