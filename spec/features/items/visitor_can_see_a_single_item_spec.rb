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
    expect(first("img")['alt']).to have_content "#{item.title}"
  end

  scenario "they see the item title" do
    expect(page).to have_content("#{item.title}")
  end

  scenario "they see the price of the item" do
    expect(page).to have_content("$#{item.price}")
  end

  scenario "they see the item's description" do
    expect(page).to have_content("#{item.description}")
  end

  scenario "they see a link to add the item to their cart" do
    click_on "Add to Cart"

    expect(page).to have_content("You have successfully added #{item.title} to your cart!")
  end
end
