require 'rails_helper'

describe "when a visitor adds an item to cart and visits cart" do
  before do
    item = create(:item, unit_price: 2)
    visit items_path
    click_on("Add to Cart")
    find("#go-to-cart").click
  end

  it "they are on the cart show page" do
    expect(current_path).to eq("/cart")
  end

  it "they can see details about the item they added" do
    expect(page).to have_content(Item.first.title)
    expect(page).to have_content(Item.first.description)
    expect(page).to have_content(Item.first.unit_price)
    expect(first("img")['alt']).to have_content(Item.first.title)
  end

  context "when a visitor has more than one item in the cart" do
    it "there is a total unit_price for all items in the cart" do
      create_list(:item, 3, unit_price: 2)
      visit items_path
      all('.add-to-cart').each &:click
      find("#go-to-cart").click

      expect(page).to have_content("10")
    end
  end

end
