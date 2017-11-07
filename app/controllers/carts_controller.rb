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
    quantity = params[:quantity].to_i
    if quantity.negative?
      flash[:danger] = 'Quantity cannot be negative'
    elsif quantity.zero?
      remove_item
    else
      @cart.update_quantity(params[:item_id], quantity)
      flash[:success] = "Quantity updated"
    end
    redirect_back(fallback_location: cart_path)
  end

  def destroy
    remove_item
    redirect_back(fallback_location: cart_path)
  end

private

  def remove_item
    item = Item.find(params[:item_id])
    @cart.remove_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] = %Q[Successfully removed #{view_context.link_to "#{item.title}", "#{item_path(item)}"} from your cart.]
  end

end
