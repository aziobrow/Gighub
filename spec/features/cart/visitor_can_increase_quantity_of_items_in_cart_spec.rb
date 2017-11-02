require 'rails_helper'

describe "when a visitor has an item in the cart" do
  before do
    item = create(:item, price: 2)
    visit items_path
    click_on("Add to Cart")
    find("#cart").click
  end

  it "they can see the current quantity of an item" do

    expect(current_path).to eq(cart_path)
    expect(find_field("quantity").value).to eq("1")
  end

  it "they can increase the quantity of that item" do
    fill_in "quantity", with: 3
    click_on "Update Quantity"

    expect(current_path).to eq(cart_path)
    expect(find_field("quantity").value).to have_content(3)
  end

  it "they can see an updated subtotal for that item" do
    fill_in "quantity", with: 3
    click_on "Update Quantity"

    expect(page).to have_content("Item Subtotal: $6")
  end

  it "they can see an updated total for the whole cart" do
    fill_in "quantity", with: 3
    click_on "Update Quantity"
    item = create(:item, price: 5)
    visit items_path
    page.all("input.add-to-cart")[1].click
    find("#cart").click

    expect(page).to have_content("Total Before Tax: $11")
  end
end
