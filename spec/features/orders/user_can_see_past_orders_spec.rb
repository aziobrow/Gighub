require 'rails_helper'

describe "when a user visits their orders index page" do
  before do
    @order = create(:order)
    visit orders_path
  end

  it "they can see a link to their order" do
    expect(page).to have_link("Order ##{@order.id}")
  end

  it "they can click the link to see order details" do
    click_on("Order ##{@order.id}")

    expect(current_path).to_eq(order_path(@order))
    expect(page).to have_content
  end
end
