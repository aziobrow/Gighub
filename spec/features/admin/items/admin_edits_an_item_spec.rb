require 'rails_helper'

feature 'When an admin clicks edit for an item' do

  background do
    allow_any_instance_of(CurrentUserHelper)
      .to receive(:current_user)
      .and_return(create(:admin))
    create(:item, id: 1)
    visit admin_items_path
    click_on('Edit')
  end

  scenario 'they are taken to a form to edit that item' do
    expect(page).to have_current_path('admin/items/1/edit')
  end

  context 'and they fill out the form and click submit' do

    background do
      fill_in 'item[title]', with: 'something unique'
      fill_in 'item[description]', with: 'something descriptive'
      fill_in 'item[price]', with: '79.99'
      click_on 'Update Item'
    end

    scenario 'they are taken back to the admin dashboard?' do
      skip 'i could see /admin/dashboard or /items/id'
    end

    scenario 'they see a success message' do
      expect(find('.alert-success'))
      .to have_content('Successfully updated something unique')
    end

    scenario 'they see the updated information' do
      expect(page).to have_content('something unique')
      expect(page).to have_content('something descriptive')
      expect(page).to have_content('$79.99')
    end

  end

end
