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
      order = create(:order_item, original_unit_price: 199, quantity: 2).order
      expect(order.total_cost).to eq(398)
    end
  end

  describe 'class methods' do
    it 'by status returns all orders of a given status' do
      order1 = create(:order, status: "paid")
      order2 = create(:order, status: "cancelled")
      order3 = create(:order, status: "ordered")
      order4 = create(:order, status: "completed")

      expect(Order.all.count).to eq(4)
      expect(Order.by_status("paid").count).to eq(1)
      expect(Order.by_status("paid").first.status).to eq("paid")
      expect(Order.by_status("cancelled").count).to eq(1)
      expect(Order.by_status("cancelled").first.status).to eq("cancelled")
      expect(Order.by_status("ordered").count).to eq(1)
      expect(Order.by_status("ordered").first.status).to eq("ordered")
      expect(Order.by_status("completed").count).to eq(1)
      expect(Order.by_status("completed").first.status).to eq("completed")
    end
  end

end
