require 'rails_helper'

describe "when a visitor selects a category" do
  it "they see a list of all items for that category" do
    category1 = create(:category)
    category2 = create(:category)
    item1 = create(:item, category: category1)
    item2 = create(:item, category: category1)
    item3 = create(:item, category: category2)
    visit category_items_path(category1.name)

    expect(current_path).to eq("/#{category1.name}")
    expect(page).to have_content("#{item1.title}")
    expect(page).to have_content("#{item2.title}")
    expect(page).to_not have_content("#{item3.title}")
    expect(first("img")['alt']).to have_content "#{item1.title}"
    expect(all("img")[1]['alt']).to have_content "#{item2.title}"
    expect(all("img").count).to eq(2)
  end
end
