require 'rails_helper'

describe Order do

  describe 'validations' do

    it 'pass with a user and address' do
      order = Order.new(
        user: create(:user),
        shipping_address: '1234 Fake St.'
      )
      expect(order).to be_valid
    end

    it 'fail without a user' do
      order = Order.new(
        shipping_address: '1234 Fake St.'
      )
      expect(order).to_not be_valid
    end

    it 'fail without an address' do
      order = Order.new(
        user: create(:user)
      )
      expect(order).to_not be_valid
    end

  end

  describe 'is associated with' do

    before { @order = create(:order) }

    it 'one user' do
      expect(@order.user).to be_a User
    end

    it 'many order items' do
      skip 'order items not implemented'
      @order.order_items << create(:order_item)
      expect(@order.order_items.first).to be_a OrderItem
    end

    it 'many items (through order items)' do
      skip 'order items not implemented'
      @order.order_items << create(:order_item)
      expect(@order.items.first).to be_a Item
    end

  end

end
