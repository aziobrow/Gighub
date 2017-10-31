class CartsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] = "You have successfully added #{item.title} to your cart!"
    redirect_to items_path
  end

  def show
    @items = @cart.cart_items
  end
end
