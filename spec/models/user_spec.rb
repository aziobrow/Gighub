require 'rails_helper'

describe User do

  describe 'validations' do

    it 'pass with unique username, unique email, and confirmed password' do
      user = User.new(
        username: 'JaneDoe89',
        email: 'janedoe89@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'fail with no username' do
      user = User.new(
        email: 'janedoe89@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'fail with duplicate username' do
      create(:user, username: 'JaneDoe89')
      user = User.new(
        username: 'JaneDoe89',
        email: 'janedoe89@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'fail with no email' do
      user = User.new(
        username: 'JaneDoe89',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'fail with duplicate email' do
      create(:user, email: 'janedoe89@example.com')
      user = User.new(
        username: 'JaneDoe89',
        username: 'JaneDoe89',
        email: 'janedoe89@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'fail with no password' do
      user = User.new(
        username: 'JaneDoe89',
        email: 'janedoe89@example.com',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'fail with non-matching password confirmation' do
      user = User.new(
        username: 'JaneDoe89',
        email: 'janedoe89@example.com',
        password: 'password',
        password_confirmation: 'nope'
      )
      expect(user).to_not be_valid
    end
  end

  describe 'defaults' do
    it 'role to "default"' do
      expect(User.new.default?).to be true
    end
  end

  describe 'is associated with' do
    before{ @user = create(:user) }

    it 'many orders' do
      user = create(:order).user
      expect(user.orders.first).to be_a Order
    end

  end

end
