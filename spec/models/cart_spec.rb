require 'rails_helper'

describe Cart do

  before do
    item1 = create(:item, id: 1, unit_price: 10)
    item2 = create(:item, id: 2, unit_price: 10)
    item3 = create(:item, id: 3, unit_price: 10)
    @cart = Cart.new("1" => 2, "2" => 3, "3" => 4)
  end

  describe '#contents' do
    it 'stores contents in a hash' do
      expect(@cart.contents).to eq({"1" => 2, "2" => 3, "3" => 4})
    end
  end

  describe '#total_count' do
    it 'can find the total count of cart contents' do
      expect(@cart.total_count).to eq(9)
    end
  end

  describe '#add_item' do
    it 'can add a new item to contents' do
      @cart.add_item("4")

      expect(@cart.contents).to eq({"1" => 2, "2" => 3, "3" => 4, "4" => 1})
    end

    it 'can add another of the same item to contents' do
      @cart.add_item("1")

      expect(@cart.contents).to eq({"1" => 3, "2" => 3, "3" => 4})
    end
  end

  describe '#remove_item' do
    it 'can remove an item from contents' do
      @cart.remove_item("1")

      expect(@cart.contents).to eq({"2" => 3, "3" => 4})
    end
  end

  describe '#count_of' do
    it 'can count the number of a single item in the cart' do
      expect(@cart.count_of("3")).to eq(4)
    end

    it 'returns zero for nonexistant item' do
      expect(@cart.count_of("0")).to eq(0)
    end
  end

  describe '#cart_items' do
    it 'returns actual item records keyed to quantities' do
      expect(@cart.cart_items).to eq({Item.first => 2, Item.second => 3, Item.third => 4})
    end
  end

  describe '#total_unit_price' do
    it 'can find the total unit_price of all contents as an integer' do
      expect(@cart.total_unit_price).to be(90)
    end
  end
end
