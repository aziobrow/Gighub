class OrdersController < ApplicationController
  before_action :require_login

  def show
    @order = current_user.orders.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end

  def create
    @order = current_user.orders.create!
    checkout_items
    if @order.save
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

  def checkout_items
    set_cart.contents.each do |key, value|
      OrderItem.create!(
        order_id: @order.id,
        item_id: key.to_i,
        unit_cost: Item.find(key.to_i),
        quantity: value
      )
    end
  end

end
