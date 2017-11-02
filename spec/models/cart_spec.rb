require 'rails_helper'

describe Cart do
  subject { Cart.new({"1" => 2, "2" => 3, "3" => 4}) }

  before do
    @item1 = Item.create!(
              title: 'item title',
              description: 'item description',
              price: 10,
              image_url: 'example.com/item.jpg',
              category: create(:category),
              id: 1)

     @item2 = Item.create!(
              title: 'item title',
              description: 'item description',
              price: 10,
              image_url: 'example.com/item.jpg',
              category: create(:category),
              id: 2)

    @item3 = Item.create!(
             title: 'item title',
             description: 'item description',
             price: 10,
             image_url: 'example.com/item.jpg',
             category: create(:category),
             id: 3)
  end

  describe '.contents' do
    it 'stores contents in a hash' do
      expect(subject.contents).to eq({"1" => 2, "2" => 3, "3" => 4})
    end
  end

  describe '.total_count' do
    it 'can find the total count of cart contents' do
      expect(subject.total_count).to eq(9)
    end
  end

  describe '.add_item' do
    it 'can add a new item to contents' do
      subject.add_item("4")

      expect(subject.contents).to eq({"1" => 2, "2" => 3, "3" => 4, "4" => 1})
    end

    it 'can add another of the same item to contents' do
      subject.add_item("1")

      expect(subject.contents).to eq({"1" => 3, "2" => 3, "3" => 4})
    end
  end

  describe '.remove_item' do
    it 'can remove an item from contents' do
      subject.remove_item("2")

      expect(subject.contents).to eq({"1" => 2, "2" => 2, "3" => 4})
    end
  end

  describe '.count_of' do
    it 'can count the number of a single item in the cart' do
      expect(subject.count_of("3")).to eq(4)
    end
  end

  describe '.cart_items' do
    it 'can format cart items as strings' do
      expect(subject.cart_items).to eq({@item1 => 2, @item2 => 3, @item3 => 4})
    end
  end

  describe '.total_price' do
    it 'can find the total price of contents' do
      expect(subject.total_price).to eq(90.00)
    end
  end
end
