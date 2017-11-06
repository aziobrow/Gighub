class OrdersController < ApplicationController
  before_action :require_login

  def show
    @order = current_user.orders.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end

  def create
    #need to make sure items go into order(add items to order)
    #set_cart.contents
    order = current_user.orders.create!
    byebug
    if order.save
      flash[:success] = "Order was successfully placed"
      redirect_to orders_path
    else
      flash[:danger] = "Unable to create order"
      redirect_to cart_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:service_address, :purchaser_name)
  end

end
