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

  def destroy
    item = Item.find(params[:item_id])
    @cart.remove_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] = %Q[Successfully removed #{view_context.link_to "#{item.title}", "/#{item_path(item)}"} from your cart.].html_safe
    redirect_back(fallback_location: root_path)
  end
end
