require 'rails_helper'

feature 'The past orders page' do

  context 'for an unauthenticated visitor' do
    scenario 'redirects to login form' do
      visit orders_path
      expect(page).to have_current_path(login_path)
    end
  end

  context 'for an authenticated user' do

    background do
      @current_user = create(:user)
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(@current_user)
    end

    context 'with no past orders' do
      scenario do
        visit orders_path
        expect(page).to have_content('You haven\'t made any orders.')
      end
    end

    context 'with past orders' do

      background do
        @order = create(:order, user: @current_user)
        @item1 = create(:order_item, order: @order).item
        @item2 = create(:order_item, order: @order).item
        visit orders_path
      end

      scenario 'they see a link to their order' do
        expect(page).to have_link("Order ##{@order.id}")
      end

      scenario "they can click the link to see order details" do
        click_on("Order ##{@order.id}")

        expect(current_path).to_eq(order_path(@order))
        expect(page).to have_content("Quantity: 1")
        expect(page).to have_content("Subtotal: $#{@order.unit_price}")
        expect(page).to have_link("#{@item1.name}")
        expect(page).to have_content("Current Status: #{@order.status}")
      end

      scenario('displays the total price of the order') do
        expect(page).to have_content('Total Cost: $%.2f' % (@order.total_cost / 100.0))
      end

      scenario('displays the date/time that the order was submitted') do
        expect(page).to have_content("Ordered: #{@order.created_at}")
      end

      scenario('displays the date/time completed if completed') do
        time = 2.days.ago
        @current_user.orders.update status: :completed, updated_at: time
        visit orders_path
        expect(page).to have_content("Completed: #{time}")
      end

      scenario('displays the date/time cancelled if cancelled') do
        time = 2.days.ago
        @current_user.orders.update status: :cancelled, updated_at: time
        visit orders_path
        expect(page).to have_content("Cancelled: #{time}")
      end

    end

  end

end
