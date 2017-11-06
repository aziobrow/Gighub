require 'rails_helper'

describe "when an admin visits admin dashboard" do
  before do
    admin = create(:user, username: 'JaneAdmin89', password: 'pw', email: 'janeadmin89@example.com', role: 'admin')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    @order1 = create(:order, status: "ordered")
    @order2 = create(:order, status: "ordered")
    @order3 = create(:order, status: "paid")
    @order4 = create(:order, status: "cancelled")
    @order5 = create(:order, status: "completed")
    visit admin_dashboard_path
  end

  it "they see a listing of all orders" do
    expect(page).to have_content("Order ##{@order1.id}")
    expect(page).to have_content("Order ##{@order2.id}")
    expect(page).to have_content("Order ##{@order3.id}")
    expect(page).to have_content("Order ##{@order4.id}")
    expect(page).to have_content("Order ##{@order5.id}")
  end

  it "they see the total number of orders for each status" do
    expect(page).to have_content("Ordered (2)")
    expect(page).to have_content("Paid (1)")
    expect(page).to have_content("Cancelled (1)")
    expect(page).to have_content("Completed (1)")
  end

  it "they see a link for each individual order" do
    expect(page).to have_link("Order ##{@order1.id}", href: admin_order_path(@order1))
    expect(page).to have_link("Order ##{@order2.id}", href: admin_order_path(@order2))
    expect(page).to have_link("Order ##{@order3.id}", href: admin_order_path(@order3))
    expect(page).to have_link("Order ##{@order4.id}", href: admin_order_path(@order4))
    expect(page).to have_link("Order ##{@order5.id}", href: admin_order_path(@order5))
  end

  it "they can filter orders to display by status type" do
    click_link("Ordered (2)")

    expect(current_path).to eq(admin_orders_path)
    expect(page).to have_link("Order ##{@order1.id}", href: admin_order_path(@order1))
    expect(page).to have_link("Order ##{@order2.id}", href: admin_order_path(@order2))
    expect(page).to_not have_link("Order ##{@order3.id}", href: admin_order_path(@order3))
    expect(page).to_not have_link("Order ##{@order4.id}", href: admin_order_path(@order4))
    expect(page).to_not have_link("Order ##{@order5.id}", href: admin_order_path(@order5))
  end

  it "they can click a link to cancel paid orders" do
    click_link("Paid (1)")

    expect(page).to have_link("Order ##{@order3.id}", href: admin_order_path(@order3))

    click_link("Cancel")
    expect(page).to_not have_link("Order ##{@order3.id}", href: admin_order_path(@order3))

    visit admin_dashboard_path

    expect(page).to have_content("Cancelled (2)")
    expect(page).to have_content("Paid (0)")
  end

  it "they can click a link to cancel ordered orders" do
    click_link("Ordered (2)")

    expect(page).to have_link("Order ##{@order1.id}", href: admin_order_path(@order1))
    expect(page).to have_link("Order ##{@order2.id}", href: admin_order_path(@order2))

    first('.cancel-link').click_link('Cancel')
    expect(page).to_not have_link("Order ##{@order1.id}", href: admin_order_path(@order1))
    expect(page).to have_link("Order ##{@order2.id}", href: admin_order_path(@order2))

    visit admin_dashboard_path

    expect(page).to have_content("Ordered (1)")
    expect(page).to have_content("Cancelled (2)")
  end

  it "they can click on a link to mark paid an ordered order" do
    click_link("Ordered (2)")

    expect(page).to have_link("Order ##{@order1.id}", href: admin_order_path(@order1))
    expect(page).to have_link("Order ##{@order2.id}", href: admin_order_path(@order2))

    first('.paid-link').click_link('Mark as Paid')
    expect(page).to_not have_link("Order ##{@order1.id}", href: admin_order_path(@order1))
    expect(page).to have_link("Order ##{@order2.id}", href: admin_order_path(@order2))

    visit admin_dashboard_path

    expect(page).to have_content("Ordered (1)")
    expect(page).to have_content("Paid (2)")
  end

  it "they can click on a link to complete a paid order" do
    click_link("Paid (1)")

    expect(page).to have_link("Order ##{@order3.id}", href: admin_order_path(@order3))

    first('.paid-link').click_link('Mark as Paid')
    expect(page).to_not have_link("Order ##{@order3.id}", href: admin_order_path(@order3))

    visit admin_dashboard_path

    expect(page).to have_content("Paid (0)")
    expect(page).to have_content("Completed (2)")
  end
end
