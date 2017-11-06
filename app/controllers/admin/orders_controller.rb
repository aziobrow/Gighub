class Admin::OrdersController < ApplicationController

  before_action :require_admin

  def show
    @order = Order.find(params[:id])
  end

  def index
    if params[:status] == "ordered"
      @orders = Order.by_status("ordered")
      @status = "ordered"
    elsif params[:status] == "paid"
      @orders = Order.by_status("paid")
      @status = "paid"
    elsif params[:status] == "cancelled"
      @orders = Order.by_status("cancelled")
      @status = "cancelled"
    else
      @orders = Order.by_status("completed")
      @status = "completed"
    end
  end

end
