require 'rails_helper'

feature 'When an admin visits an order page' do

  background do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(create(:admin))

    order = create(:order)
    items = create_list(:item, 2, unit_price: 7)
    create(:order_item, order: order, quantity: 1, item: items.first)
    create(:order_item, order: order, quantity: 2, item: items.last)
    visit admin_order_path(order)
  end

  scenario 'they can see the order\'s date and time' do
    expect(page).to have_content(Order.first.created_at)
  end

  scenario 'they see the order status' do
    expect(page).to have_content(Order.first.status)
  end

  scenario 'they see the total cost' do
    expect(page).to have_content(Order.first.total_cost)
  end

  scenario 'they can see the purchaser\'s full name and address' do
    expect(page).to have_content(Order.first.purchaser_name)
    expect(page).to have_content(Order.first.service_address)
  end

  feature 'and looks at each item' do

    scenario 'they see the name linked to the details page' do
      expect(page).to have_link(Item.first.title, href: item_path(Item.first))
      expect(page).to have_link(Item.last.title, href: item_path(Item.last))
    end

    scenario 'they see the unit unit_price' do
      expect(page).to have_content(OrderItem.first.unit_cost)
      expect(page).to have_content(OrderItem.last.unit_cost)
    end

    scenario 'they see the quantity' do
      expect(page).to have_content(OrderItem.first.quantity)
      expect(page).to have_content(OrderItem.last.quantity)
    end

    scenario 'they see the subtotal' do
      expect(page).to have_content(OrderItem.first.subtotal)
      expect(page).to have_content(OrderItem.last.subtotal)
    end

  end

end
