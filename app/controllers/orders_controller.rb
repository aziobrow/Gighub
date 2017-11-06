class OrdersController < ApplicationController
  before_action :require_login

  def show
    @order = current_user.orders.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end

  def update
    @orders = Order.update(params[:id], status: params[:status])
    redirect_back(fallback_location: admin_dashboard_path)
  end

end
