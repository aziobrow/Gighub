require 'rails_helper'

feature 'When a visitor with items in their cart views their cart and clicks "Remove"' do

  background do
    deleted = create(:item, title: "DELETED_ITEM")
    Cart.add_item(deleted.id)
    visit cart_path
    click_on "Remove"
  end

  it 'they stay on the page' do
    expect(page).to have_current_path('/cart')
  end

  it 'they see a success message' do
    expect(find('.success')).to have_content('Successfully removed DELETED_ITEM from your cart.')
  end

  it 'the title in the success message should be a link to that item' do
    expect(find('.success')).to have_link('DELETED_ITEM', href: item_path(Item.first))
  end

  it 'they no longer see the item listed' do
    expect(find('#cart-items')).to_not have_content('DELETED_ITEM')
  end

end
