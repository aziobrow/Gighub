require 'rails_helper'

feature 'when a visitor goes to the items index page' do

  background do
    create_list(:item, 2)
    visit items_path
  end

  scenario 'they can see a list of all items' do
    expect(current_path).to eq('/items')
    expect(page).to have_content(Item.first.title)
    expect(page).to have_content(Item.second.title)
    expect(first('img')['alt']).to have_content(Item.first.title)
    expect(all('img')[1]['alt']).to have_content(Item.second.title)
    expect(all('img').count).to eq(2)
  end

  scenario 'they do not see that an active item is retired' do
    expect(page).to_not have_content(/retired/i)
  end

  scenario 'they see that a retired item is retired' do
    create(:item, active: false)
    visit items_path
    expect(page).to have_content(/retired/i)
  end

end
