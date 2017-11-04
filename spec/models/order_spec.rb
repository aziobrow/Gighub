require 'rails_helper'

describe Order do

  describe 'validations' do

    it 'pass with a user' do
      order = Order.new(user: create(:user))
      expect(order).to be_valid
    end

    it 'fail without a user' do
      expect(Order.new).to_not be_valid
    end
        
    it 'pass with optional service address' do
      order = Order.new(user: create(:user), service_address: '1234 Fake St.')
      expect(order).to be_valid
    end


  end

  describe 'defaults' do
    before do
      @order = Order.create(user: create(:user))
    end
    it 'status to "ordered"' do
      expect(@order.ordered?).to be true
    end
    it 'purchaser name to the user\'s username' do
      expect(@order.purchaser_name).to eq(@order.user.username)
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
    it '#total_cost returns the total cost in cents' do
      order = create(:order_item, unit_cost: 199, quantity: 2).order
      expect(order.total_cost).to eq(398)
    end
  end

end
