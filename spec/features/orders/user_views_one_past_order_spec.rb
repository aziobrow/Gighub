require 'rails_helper'

feature 'The past order show page' do

  context 'for an unauthenticated visitor' do
    scenario 'redirects to login form' do
      visit order_path(create(:order))
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

    scenario 'halts with 404 if user is not the purchaser' do
      expect{ visit order_path(create(:order)) }.to raise_error(
        ActiveRecord::RecordNotFound
      )
    end

    context 'who is the purchaser' do

      background do
        @order = create(:order, user: @current_user)
        @item1 = create(:order_item, order: @order).item
        @item2 = create(:order_item, order: @order).item
        visit order_path(@order)
      end

      scenario 'displays each item title' do
        expect(page).to have_content(@item1.title)
                    .and have_content(@item2.title)
      end

      scenario 'has a link to each item page' do
        expect(page).to have_link(href: item_path(@item1))
                    .and have_link(href: item_path(@item2))
      end

      scenario 'displays the order item subtotal for each item' do
        expect(page).to have_content(
          'Subtotal: $%.2f' % (@item1.order_items.first.subtotal / 100.0)
        ).and have_content(
          'Subtotal: $%.2f' % (@item2.order_items.first.subtotal / 100.0)
        )
      end

      scenario 'displays the quantity purchased of each item' do
        expect(page).to have_content(
          "Quantity: #{@item1.order_items.first.quantity}"
        ).and have_content(
          "Quantity: #{@item2.order_items.first.quantity}"
        )
      end

      scenario 'displays the total unit_price of the order' do
        expect(page).to have_content('Total Cost: $%.2f' % (@order.total_cost / 100.0))
      end

      scenario 'displays the date/time that the order was submitted' do
        expect(page).to have_content("Ordered: #{@order.created_at.strftime("%m/%d/%Y")}")
      end

      scenario 'displays the date/time completed if completed' do
        time = 2.days.ago
        @order.update status: :completed, updated_at: time
        @order.update(updated_at: 2.days.ago)
        visit order_path(@order)
        expect(page).to have_content("Completed: #{2.days.ago}")
      end

      scenario 'displays the date/time cancelled if cancelled' do
        time = 2.days.ago
        @order.update status: :cancelled, updated_at: time
        visit order_path(@order)
        expect(page).to have_content("Cancelled: #{time}")
      end

    end

  end

end
