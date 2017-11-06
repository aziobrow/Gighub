class Admin::ItemsController < ApplicationController

  before_action :require_admin

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      item.price = (item.price.to_f * 100).to_i
      flash[:success] = "#{item.title} successfully created"
      redirect_to item_path(item)
    else
      flash[:danger] = item.errors.full_messages.join("\n")
      redirect_to new_admin_item_path
    end
  end

private

  def item_params
    raw_params = params.require(:item).permit(
      :title,
      :description,
      :price,
      :category_id,
      :image_url
    )
    raw_params[:price] = (raw_params[:price].to_f * 100).to_i
    raw_params
  end

end
