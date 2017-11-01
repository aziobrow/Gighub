class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:category_name])
  end
end
