require 'rails_helper'

describe "as an authenticated user" do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  xit "they cannot view another user's order show page" do


  end

  it "they cannot visit an admin order show page" do
    order = create(:order)

    expect{ visit admin_order_path(order) }.to raise_error(ActionController::RoutingError)
  end

  it "they cannot visit an admin dashboard" do
    expect{ visit admin_dashboard_path }.to raise_error(ActionController::RoutingError)
  end
end
