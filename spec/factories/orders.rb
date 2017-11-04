FactoryBot.define do
  factory :order do

    user
    sequence(:service_address) { |n| "#{n} Fake St." }

  end
end
