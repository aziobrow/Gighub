require 'rails_helper'

describe "as an unauthenticated user" do

  it "they cannot view a user's order show page" do
    order = create(:order)
    visit order_path(order)

    expect(current_path).to eq(login_path)
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

  it "they are redirected to login screen when they try to check out" do
    item = create(:item)
    visit items_path
    first("input.add-to-cart").click
    find("#go-to-cart").click

    expect(current_path).to eq(cart_path)

    click_on("Login or Create Account to Checkout")

    expect(current_path).to eq(login_path)
  end
end
