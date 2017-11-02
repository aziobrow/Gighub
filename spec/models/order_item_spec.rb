require 'rails_helper'

describe OrderItem do

  describe 'validations' do

    it 'pass with an order, item, quantity, and cost' do
      order_item = OrderItem.new(
        order: create(:order),
        item: create(:item),
        quantity: 1,
        cost: 1
      )
      expect(order_item).to be_valid
    end

    it 'fail without an order' do
      order_item = OrderItem.new(
        item: create(:item),
        quantity: 1,
        cost: 1
      )
      expect(order_item).to_not be_valid
    end

    it 'fail without an item' do
      order_item = OrderItem.new(
        order: create(:order),
        quantity: 1,
        cost: 1
      )
      expect(order_item).to_not be_valid
    end

    it 'fail without a quantity' do
      order_item = OrderItem.new(
        order: create(:order),
        item: create(:item),
        cost: 1
      )
      expect(order_item).to_not be_valid
    end

    it 'fail without a cost' do
      order_item = OrderItem.new(
        order: create(:order),
        item: create(:item),
        quantity: 1
      )
      expect(order_item).to_not be_valid
    end

  end

  describe 'is associated with' do

    before { @order_item = create(:order_item) }

    it 'one order' do
      expect(@order_item.order).to be_a Order
    end

    it 'one item' do
      expect(@order_item.item).to be_a Item
    end

  end

  describe 'instance methods' do
    it '#subtotal returns the cost * quantity as a float' do
      order_item = create(:order_item, cost: 199, quantity: 2)
      expect(order_item.subtotal).to eq(3.98)
    end
  end

end
