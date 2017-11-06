require 'rails_helper'

feature 'When an admin user logs in' do

  scenario 'they are taken to the admin dashboard' do
    admin = create(:user, role: :admin, password: '1234')
    visit login_path
    fill_in 'session[username]', with: admin.username
    fill_in 'session[password]', with: '1234'
    click_button('Login')
  end

end
