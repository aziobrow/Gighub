require 'rails_helper'

feature 'When an default user visits an admin page' do

  background do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(create(:user))
  end

  describe 'for an order' do
    scenario 'they get the 404 page' do
      skip
      visit admin_order_path(create(:order))
      expect(page).to have_status 404
      expect(page).to have_content('not found')
    end
  end

end
