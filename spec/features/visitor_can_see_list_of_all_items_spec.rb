require 'rails_helper'

describe "when a visitor goes to the items index page" do
  it "they can see a list of all items" do
    item1 = create(:item)
    item2 = create(:item)
    visit items_path

    expect(current_path).to eq('/items')
    expect(page).to have_content("#{item1.title}")
    expect(page).to have_content(item1.image_url)
    expect(page).to have_content("#{item2.title}")
    expect(page).to have_content(item2.image_url)
  end
end
