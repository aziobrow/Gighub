FactoryBot.define do
  factory :order do

    user
    sequence(:shipping_address) { |n| "#{n} Fake St." }

  end
end
