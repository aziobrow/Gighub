class Admin::UsersController < ApplicationController

  before_action :require_admin

  def show
    @all_orders = Order.all
    @orders = Order.parse_params(params)
    @status = Order.retrieve_status(params)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.update(current_user.id, admin_user_params)
    flash[:success] = "Profile Successfully Updated"
    redirect_to admin_dashboard_path
  end

  private

  def admin_user_params
    params.require(:user).permit(:username, :email, :name, :address)
  end

end
