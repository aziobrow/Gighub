require 'rails_helper'

feature 'When a visitor visits the login page and clicks "Create Account"' do

  background do
    visit login_path
    click_on "Create Account"
    fill_in 'user[username]', with: 'JaneDoe89'
    fill_in 'user[email]', with: 'janedoe89@example.com'
    fill_in 'user[password]', with: 'pw'
    fill_in 'user[password_confirmation]', with: 'pw'
    click_on 'Create User'
  end

  scenario 'they are taken to the user dashboard' do
    expect(page).to have_current_path('/dashboard')
  end

  scenario 'they see a success message' do
    expect(find('.success')).to have_content('Logged in as JaneDoe89')
  end

  scenario 'they see their profile info' do
    expect(find('main')).to have_content('JaneDoe89')
    expect(find('main')).to have_content('janedoe89@example.com')
  end

  scenario 'they do not see a "Login" button' do
    expect(page).to_not have_link("Login")
  end

  scenario 'they see a "Logout" button' do
    expect(page).to have_link("Logout", href: logout_path)
  end

end
