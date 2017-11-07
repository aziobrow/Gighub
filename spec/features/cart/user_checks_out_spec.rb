require 'rails_helper'

feature 'the cart page' do
  context 'when a user places an order' do
    before do
      @current_user = create(:user)
      allow_any_instance_of(CurrentUserHelper)
        .to receive(:current_user)
        .and_return(@current_user)
      create(:item)
      visit items_path
      first("input.add-to-cart").click
      visit cart_path
      click_on("Checkout")
    end

    scenario 'the current page is /orders' do
      expect(current_path).to eq(orders_path)
    end

    scenario 'the user sees a success message' do
      expect(find('.alert-success')).to have_content('Order was successfully placed')
    end

    scenario 'the user sees the placed order in a table' do
      expect(page).to have_content(Item.first.title)
      expect(page).to have_content(Item.first.unit_price)
      expect(page).to have_content("Quantity: #{OrderItem.first.quantity}")
      expect(page).to have_content('Subtotal: $%.2f' % (OrderItem.first.subtotal / 100.0))
    end
  end
end
