require 'rails_helper'

describe Item do

  describe 'validations' do

    it 'succeed with a unique title, description, price, image url, and category' do
      item = Item.new(
        title: 'item title',
        description: 'item description',
        price: 9.99,
        image_url: 'example.com/item.jpg',
        category: create(:category)
      )
      expect(item).to be_valid
    end

    it 'fail when the title is already taken' do
      create(:item, title: 'item title')
      item = Item.new(
        title: 'item title',
        description: 'item description',
        price: 9.99,
        image_url: 'example.com/item.jpg',
        category: create(:category)
      )
      expect(item).to_not be_valid
    end

    it 'fail without a title' do
      item = Item.new(
        description: 'item description',
        price: 9.99,
        image_url: 'example.com/item.jpg',
        category: create(:category)
      )
      expect(item).to_not be_valid
    end

    it 'fail without a description' do
      item = Item.new(
        title: 'item name',
        price: 9.99,
        image_url: 'example.com/item.jpg',
        category: create(:category)
      )
      expect(item).to_not be_valid
    end

    it 'fail without a price' do
      item = Item.new(
        title: 'item name',
        description: 'item description',
        image_url: 'example.com/item.jpg',
        category: create(:category)
      )
      expect(item).to_not be_valid
    end

    it 'fail without an image url' do
      item = Item.new(
        title: 'item name',
        description: 'item description',
        price: 9.99,
        category: create(:category)
      )
      expect(item).to_not be_valid
    end

    it 'fail without a category' do
      item = Item.new(
        title: 'item name',
        description: 'item description',
        price: 9.99,
        image_url: 'example.com/item.jpg'
      )
      expect(item).to_not be_valid
    end
  end

  describe 'defaults' do
    it 'active to true' do
      expect(Item.new.active).to be true
    end
  end

  describe 'is associated with' do

    before { @item = create(:item) }

    it 'one category' do
      expect(@item.category).to be_a(Category)
    end

  end

end
