require 'rails_helper'

describe Category do

  describe 'validations' do

    it 'succeed with a name' do
      category = Category.new(name: 'things')
      expect(category).to be_valid
    end

    it 'fail without a name' do
      category = Category.new()
      expect(category).to_not be_valid
    end

  end

  describe 'is associated with' do

    before { @category = create(:category) }

    it 'many items' do
      @category.items << create(:item)
      expect(@category.items.first).to be_a(Item)
    end

  end

end
