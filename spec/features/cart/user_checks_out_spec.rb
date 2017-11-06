require 'rails_helper'

feature 'a user visits their cart' do
  scenario 'the user checks out' do
    before do
      create(:item)
      visit items_path
      first("input.add-to-cart").click
      find("#go-to-cart").click

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit cart_path
    end

    it 'the order is placed' do
      expect(user.orders.last.status).to eq('ordered')
    end

    it 'the current page is /orders' do
      expect(current_path).to eq(orders_path)
    end

    it 'the user sees a success message' do
      expect(page).to have_content('Order was successfully placed')
    end

    it 'the user sees the placed order in a table' do
      expect(page).to have_content(Item.first.title)
      expect(page).to have_content(Item.first.price)
      expect(page).to have_content(Item.first.description)
      expect(first("img")['alt']).to have_content(Item.first.title)
    end
  end
end
