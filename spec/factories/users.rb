FactoryBot.define do
  factory :user do
    sequence(:name)   {|n| "name_#{n}"}
    sequence(:address)   {|n| "address_#{n}"}
    sequence(:username)   {|n| "username_#{n}"}
    sequence(:password)   {|n| "password_#{n}"}
    sequence(:email)      {|n| "email_#{n}"}

    factory :admin do
      role :admin
    end
  end
end
