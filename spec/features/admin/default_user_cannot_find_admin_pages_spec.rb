require 'rails_helper'

feature 'When an default user visits an admin page' do

  background do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(create(:user))
  end

  describe 'for an order' do
    scenario 'they get the 404 page' do
      visit admin_order_path(create(:order))

      expect(page.status_code).to eq(404)
    end
  end

  describe 'for an admin dashboard' do
    scenario 'they get the 404 page' do
      visit admin_order_path(create(:order))
      expect(page.status_code).to eq(404)
    end
  end

  describe 'for an admin edit page' do
    scenario 'they get the 404 page' do
      visit admin_order_path(create(:order))
      expect(page.status_code).to eq(404)
    end
  end

end
