require 'rails_helper'

feature 'When a logged-in user tries to log out' do

  background do
    create(:user, username: 'JaneDoe89', password: 'pw')
    visit items_path
    find('nav').click_on('Login')
    fill_in 'session[username]', with: 'JaneDoe89'
    fill_in 'session[password]', with: 'pw'
    find('form').click_on('Login')
    visit items_path
    click_on('Logout')
  end

  scenario 'they are redirected back to the same page' do
    expect(page).to have_current_path('/items')
  end

  scenario 'they see a success message' do
    expect(find('.success')).to have_content('Successfully logged out')
  end

  scenario 'they see a "Login" button' do
    expect(find('nav')).to have_link("Login", href: login_path)
  end

  scenario 'they do not see a "Logout" button' do
    expect(page).to_not have_button("Logout")
  end

end
