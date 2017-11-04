# As a logged in Admin When I visit “/admin/dashboard” I will see a heading on the page that says “Admin Dashboard”
#
# As a registered user When I visit “/admin/dashboard” I get a 404
#
# As an unregistered user When I visit “/admin/dashboard” I get a 404
require 'rails_helper'

feature 'When I visit /admin/dashboard' do

  scenario 'as an admin, they are taken to the admin dashboard' do
    admin = create(:user, username: 'JaneAdmin89', password: 'pw', email: 'janeadmin89@example.com', role: 'admin')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_dashboard_path

    expect(page).to have_content("Admin Dashboard")
  end

  scenario 'as a logged in user, they get a 404' do
    user = create(:user, username: 'JaneDoe89', password: 'pw', email: 'janedoe89@example.com')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect{ admin_dashboard_path }.to raise_error(ActionController::RoutingError)
  end

  scenario 'as a visitor, they get a 404' do
    expect{ admin_dashboard_path }.to raise_error(ActionController::RoutingError)
  end

end
