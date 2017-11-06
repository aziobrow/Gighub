require 'rails_helper'

feature 'the cart page' do
  context 'when a user places and order' do
    before do
      create(:item)
      visit items_path
      first("input.add-to-cart").click
      find("#go-to-cart").click
    end

    scenario 'the order is placed' do
      user = create(:user)
      allow_any_instance_of(CurrentUserHelper).to receive(:current_user).and_return(user)
      visit cart_path
      click_on("Checkout")

      expect(user.orders.last.status).to eq('ordered')
    end

    scenario 'the current page is /orders' do
      user = create(:user)
      allow_any_instance_of(CurrentUserHelper).to receive(:current_user).and_return(user)
      visit cart_path
      click_on("Checkout")

      expect(current_path).to eq(orders_path)
    end

    scenario 'the user sees a success message' do
      user = create(:user)
      allow_any_instance_of(CurrentUserHelper).to receive(:current_user).and_return(user)
      visit cart_path
      click_on("Checkout")

      expect(page).to have_content('Order was successfully placed')
    end

    scenario 'the user sees the placed order in a table' do
      user = create(:user)
      allow_any_instance_of(CurrentUserHelper).to receive(:current_user).and_return(user)
      visit cart_path
      click_on("Checkout")

      expect(page).to have_content(Item.first.title)
      expect(page).to have_content(Item.first.price)
      expect(page).to have_content(Item.first.description)
      expect(first("img")['alt']).to have_content(Item.first.title)
    end
  end
end
