require 'rails_helper'

describe "an admin can edit personal info" do
  before do
    admin = create(:user, role: 'admin')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_dashboard_path
  end

  it "they see a link to update profile" do
    expect(page).to have_link("Update Profile Information")
  end

  it "they can see an edit form to update information" do
    click_on("Update Profile Information")

    expect(current_path).to eq(admin_edit_path)
    expect(page).to have_content("Username")
    expect(page).to have_content("Email")
    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    fill_in "user[username]", with: "newname1"
    click_button "Update Profile"

    expect(current_path).to eq(admin_dashboard_path)
  end
end
