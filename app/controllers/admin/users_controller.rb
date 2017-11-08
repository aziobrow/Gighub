class Admin::UsersController < ApplicationController

  before_action :require_admin

  def show
    @all_orders = Order.all
    @orders = Order.parse_params(params)
  end

end
