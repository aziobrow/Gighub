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

      scenario 'displays each item title' do
        expect(page).to have_content(@item1.title)
                    .and have_content(@item2.title)
      end

      scenario 'has a link to each item page' do
        expect(page).to have_link(href: item_path(@item1))
                    .and have_link(href: item_path(@item2))
      end

      scenario('displays the total price of the order') do
        expect(page).to have_content('Total Cost: $%.2f' % (@order.total_cost / 100.0))
      end

      scenario('displays the date/time that the order was submitted') do
        expect(page).to have_content("Ordered: #{@order.created_at}")
      end

      scenario('displays the date/time completed if completed') do
        @current_user.orders.update status: :completed, updated_at: 2.days.ago
        visit orders_path
        expect(page).to have_content("Completed: #{2.days.ago}")
      end

      scenario('displays the date/time cancelled if cancelled') do
        @current_user.orders.update status: :cancelled, updated_at: 2.days.ago
        visit orders_path
        expect(page).to have_content("Cancelled: #{2.days.ago}")
      end

    end

  end

end
