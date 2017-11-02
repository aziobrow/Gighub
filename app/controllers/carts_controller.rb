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

  def update
    item = Item.find(params[:item_id])
    @cart.update_quantity(item.id, params[:quantity].to_i)
    redirect_back(fallback_location: cart_path)
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.remove_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] = %Q[Successfully removed #{view_context.link_to "#{item.title}", "#{item_path(item)}"} from your cart.]
    redirect_back(fallback_location: cart_path)
  end
end
