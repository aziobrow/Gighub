require 'rails_helper'

feature 'When an admin visits an order page' do

  background do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(create(:admin))

    order = create(:order)
    items = create_list(:item, 2, price: 999)
    create(:order_item, order: order, item: items.first)
    create_list(:order_item, order: order, item: items.last)
    visit admin_order_path(order)
  end

  scenario 'they can see the order\'s date and time' do
    expect(page).to have_content(Order.first.created_at)
  end

  scenario 'they see the order status' do
    expect(page).to have_content(Order.first.status)
  end

  scenario 'they see the total price' do
    expect(page).to have_content(Order.first.total_price)
  end

  scenario 'they can see the purchaser\'s full name and address' do
    expect(page).to have_content(Order.first.purchaser_name)
    expect(page).to have_content(Order.first.service_address)
  end

  scenario 'they can see the purchaser\'s full name and address' do
    expect(page).to have_content(Order.first.purchaser_name)
    expect(page).to have_content(Order.first.service_address)
  end

  feature 'and looks at each item' do

    background { skip }

    scenario 'they see the item name linked to the item page' do

    end

    scenario 'they see the item quantity' do

    end

    scenario 'they see the item subtotal' do

    end

  end

end
