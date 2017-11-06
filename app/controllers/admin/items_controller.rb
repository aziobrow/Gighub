class Admin::ItemsController < ApplicationController

  before_action :require_admin

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      flash[:success] = "#{item.title} successfully created"
      redirect_to item_path(item)
    else
      flash[:danger] = item.errors.full_messages.join("\n")
      redirect_to new_admin_item_page
    end
  end

private

  def item_params
    params.require(:item).permit(
      :title,
      :description,
      :price,
      :category_id,
      :image_url
    )
  end

end
