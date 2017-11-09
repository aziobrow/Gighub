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

  def require_admin
    not_found unless admin_logged_in?
  end

  def render_404
    render file: "#{Rails.root}/public/404", layout: false, status: :not_found
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
    render_404
  end


  def flash_save_errors(record)
    flash[:danger] = record.errors.full_messages.join("\n")
  end

end
