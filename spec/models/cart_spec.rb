require 'rails_helper'

describe Cart do
  describe '.contents' do
    it 'stores contents in a hash' do

    end

    it 'can have no contents' do

    end

    it 'can have several contents' do

    end
  end

  describe '.total_count' do
    it 'can find the total count of cart contents' do

    end
  end

  describe '.add_item' do
    it 'can add a new item to contents' do

    end
  end

  describe '.remove_item' do
    it 'can remove an item from contents' do

    end
  end

  describe '.count_of' do
    it 'can count the number of a single item (by id) in the cart' do

    end
  end

  describe '.cart_items' do
    it 'can format cart items as strings' do

    end
  end

  describe '.total_price' do
    it 'can find the total price of contents' do

    end
  end

end

  # attr_reader :contents
  #
  # def initialize(initial_contents)
  #   @contents = initial_contents || {}
  # end
  #
  # def total_count
  #   contents.values.sum
  # end
  #
  # def add_item(id)
  #   contents[id.to_s] = (contents[id.to_s] || 0) + 1
  # end
  #
  # def remove_item(id)
  #   contents[id.to_s] -= 1
  #   if contents[id.to_s] == 0
  #     contents.delete(id.to_s)
  #   end
  # end
  #
  # def count_of(id)
  #   contents[id.to_s] || 0
  # end
  #
  # def cart_items
  #   contents.transform_keys {|key| Item.find(key.to_i)}
  # end
  #
  # def total_price
  #   cart_items.sum  {|item, quantity| item.price * quantity}
  # end
