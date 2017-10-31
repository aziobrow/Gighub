FactoryBot.define do
  factory :user do
    sequence(:username)   {|n| "username_#{n}"}
    sequence(:password)   {|n| "password_#{n}"}
    sequence(:email)      {|n| "email_#{n}"}
  end
end
