require 'rails_helper'

feature 'When an admin creates an item' do

  background do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(create(:admin))
    create(:category, name: 'Things')

    visit new_admin_item_path
    fill_in 'item[title]', with: 'something unique'
    fill_in 'item[description]', with: 'something descriptive'
    fill_in 'item[price]', with: '9.99'
    select 'Things', from: 'item[category_id]'
  end

  scenario 'they are taken to the item page' do
    click_on 'Create Item'
    expect(page).to have_current_path(item_path(Item.last))
  end

  scenario 'they see the details they just entered' do
    click_on 'Create Item'
    expect(page).to have_content('something unique')
               .and have_content('something descriptive')
               .and have_content('$9.99')
               .and have_content('Things')
  end

  context 'with the optional image url' do
    scenario 'they see the image show up on the page' do
      fill_in 'item[image_url]', with: 'http://backend.turing.io/assets/images/full-logo.png'
      click_on 'Create Item'
      expect(page).to have_css('img[src$="full-logo.png"]')
    end
  end

end
