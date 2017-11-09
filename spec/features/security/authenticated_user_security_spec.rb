require 'rails_helper'

describe "as an authenticated user" do
  before do
    user1 = create(:user)
    @user2 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
  end

  it "they cannot view another user's order show page" do
    order = create(:order, user: @user2)
    visit order_path(order)

    expect(page.status_code).to eq(404)
  end

  it "they cannot visit an admin order show page" do
    order = create(:order)
    visit admin_order_path(order)

    expect(page.status_code).to eq(404)
  end

  it "they cannot visit an admin dashboard" do
    visit admin_dashboard_path

    expect(page.status_code).to eq(404)
  end
end
