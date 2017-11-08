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
      expect(page).to have_css '#order-table'
      within '#order-table' do
        expect(page).to have_text "Order ##{Order.last.id}"
        expect(page).to have_text "#{Order.last.created_at.strftime("%m/%d/%Y")}"
      end
    end

  end
end
