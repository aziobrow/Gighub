require 'rails_helper'

describe "when a visitor has an item in the cart" do
  before do
    create(:item, price: 2)
    visit items_path
    first("input.add-to-cart").click
    first("input.add-to-cart").click
    first("input.add-to-cart").click
    find("#go-to-cart").click
  end

  it "they can see the current quantity of an item" do
    expect(current_path).to eq(cart_path)
    expect(find_field("quantity").value).to eq("3")
  end

  it "they can decrease the quantity of that item" do
    fill_in "quantity", with: 1
    click_on "Update Quantity"

    expect(current_path).to eq(cart_path)
    expect(find_field("quantity").value).to have_content(1)
  end

  it "they can see an updated subtotal for that item" do
    fill_in "quantity", with: 1
    click_on "Update Quantity"

    expect(page).to have_content("Item Subtotal: $2")
  end

  it "they can see an updated total for the whole cart" do
    fill_in "quantity", with: 1
    click_on "Update Quantity"
    item = create(:item, price: 5)
    visit items_path
    page.all("input.add-to-cart")[1].click
    find("#go-to-cart").click

    expect(page).to have_content("Total Before Tax: $7")
  end
end
