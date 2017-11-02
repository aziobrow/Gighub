class Admin::OrdersController < ApplicationController

  before_action :require_login, :require_admin

  def show
    @order = Order.find(params[:id])
  end

private

  def require_admin
    raise ActionController::RoutingError unless current_user.admin?
  end

end
