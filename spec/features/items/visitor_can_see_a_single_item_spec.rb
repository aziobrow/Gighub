require 'rails_helper'

feature "when a visitor goes to the item show page"do
  let :item { create(:item) }
  before(:example) do
    visit item_path(item)
  end

  scenario "they are on the item's show page" do
    expect(current_path).to eq("/items/#{item.id}")
  end

  scenario "they see an image of the item" do
    expect(first("img")['alt']).to have_content(item.title)
  end

  scenario "they see the item title" do
    expect(page).to have_content(item.title)
  end

  scenario "they see the price of the item" do
    expect(page).to have_content('$%.2f' % (item.price / 100.0))
  end

  scenario "they see the item's description" do
    expect(page).to have_content(item.description)
  end

  scenario "they see a link to add the item to their cart" do
    click_on "Add to Cart"
    expect(page).to have_content("You have successfully added #{item.title} to your cart!")
  end

  scenario "they do not see that an active item is retired" do
    expect(page).to_not have_content(/retired/i)
  end

  scenario "they see that a retired item is retired" do
    visit item_path(create(:item, active: false))
    expect(page).to have_content(/retired/i)
  end

end
