class Admin::ItemsController < ApplicationController

  before_action :require_admin

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      flash[:success] = "#{item.title} successfully created"
      redirect_to item_path(item)
    else
      flash_save_errors(item)
      redirect_to new_admin_item_path
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      flash[:success] = "Successfully updated #{item.title}"
      redirect_to item_path
    else
      flash_save_errors(item)
      redirect_to admin_edit_item_path(item)
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
    raw_params[:price] = (raw_params[:price].to_f * 100).round
    raw_params
  end

end
