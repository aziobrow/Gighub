require 'rails_helper'

describe Order do

  describe 'validations' do

    it 'pass with a user, purchaser_name' do
      order = Order.new(
        user: create(:user),
        purchaser_name: 'Jane Doe',
      )
      expect(order).to be_valid
    end

    it 'pass with optional service address' do
      order = Order.new(
        user: create(:user),
        purchaser_name: 'Jane Doe',
        service_address: '1234 Fake St.'
      )
      expect(order).to be_valid
    end

    it 'fail without a user' do
      order = Order.new(
        purchaser_name: 'Jane Doe',
      )
      expect(order).to_not be_valid
    end

    it 'fail without a purchaser name' do
      order = Order.new(
        user: create(:user),
      )
      expect(order).to_not be_valid
    end

  end

  describe 'defaults' do
    it 'status to "ordered"' do
      order = Order.create(
        user: create(:user),
        purchaser_name: 'Jane Doe',
        status: :ordered
      )
      expect(order.ordered?).to be true
    end
  end

  describe 'is associated with' do

    before { @order = create(:order) }

    it 'one user' do
      expect(@order.user).to be_a User
    end

    it 'many order items' do
      @order.order_items << create(:order_item)
      expect(@order.order_items.first).to be_a OrderItem
    end

  end

  describe 'instance methods' do
    it '#total_cost returns the total cost as a float' do
      order = create(:order_item, cost: 199, quantity: 2).order
      expect(order.total_cost).to eq(3.98)
    end
  end

end
