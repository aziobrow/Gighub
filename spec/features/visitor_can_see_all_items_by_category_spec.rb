require 'rails_helper'

describe "when a visitor selects a category" do
  it "they see a list of all items for that category" do
    category1 = create(:category)
    category2 = create(:category)
    item1 = create(:item, category: category1)
    item2 = create(:item, category: category1)
    item3 = create(:item, category: category2)
    visit category_path(category1)

    expect(current_path).to eq("categories/#{category1.id}")
    expect(page).to have_content("#{item1.title}")
    expect(page).to have_content("#{item2.title}")
    expect(page).to_not have_content("#{item3.title}")
    expect(page).to have_content(item1.image_url)
    expect(page).to have_content(item2.image_url)
    expect(page).to_not have_content(item3.image_url)
  end
end
