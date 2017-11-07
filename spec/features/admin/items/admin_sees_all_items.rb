require 'rails_helper'

feature 'When an admin clicks "All Items" from their dashboard' do

  background do
    allow_any_instance_of(CurrentUserHelper)
      .to receive(:current_user)
      .and_return(create(:admin))
    create_list(:item, 2)
    visit admin_dashboard_path
    find('main').click_on 'All Items'
  end

  scenario 'they are taken to the admin item index' do
    expect(page).to have_current_path('admin/items')
  end

  scenario 'they see the titles linked to the show pages' do
    expect(page).to have_link(Item.first.title, href: item_path(Item.first))
    expect(page).to have_link(Item.second.title, href: item_path(Item.second))
  end

  scenario 'they see thumbnails' do
    expect(page).to have_css("img[src$='#{Item.first.image_url}']")
    expect(page).to have_css("img[src$='#{Item.second.image_url}']")
  end

  scenario 'they see descriptions' do
    expect(page).to have_content(Item.first.description)
    expect(page).to have_content(Item.second.description)
  end

  scenario 'they see only retired items marked as retired' do
    expect(page).to_not have_content('RETIRED')
    Item.first.retire
    visit admin_items_path
    expect(page).to have_content('RETIRED')
  end

  scenario 'they see links to edit the items' do
    expect(page).to have_link("Edit", href: edit_admin_item_path(Item.first))
    expect(page).to have_link("Edit", href: edit_admin_item_path(Item.second))
  end

end
