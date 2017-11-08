require 'rails_helper'

describe "a visitor visits their cart" do
  before do
    item = create(:item)
    visit items_path
    first("input.add-to-cart").click
    find("#go-to-cart").click
  end

    it "they do not see an option to checkout" do
      expect(current_path).to eq(cart_path)
      expect(page).to have_content(Item.first.title)
      expect(page).to have_content(Item.first.unit_price)
      expect(page).to have_content(Item.first.description)
      expect(first("img")['alt']).to have_content(Item.first.title)
      expect(page).to have_content("Login or Create Account to Checkout")
    end

    it "they see an option to checkout after signing up" do
      click_on("Login or Create Account to Checkout")

      expect(current_path).to eq(login_path)

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit cart_path

      expect(page).to have_content("Checkout")
    end

    it "they see all of the data that was there before logging in" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit cart_path

      expect(page).to have_content(Item.first.title)
      expect(page).to have_content(Item.first.unit_price)
      expect(page).to have_content(Item.first.description)
      expect(first("img")['alt']).to have_content(Item.first.title)
    end
end
