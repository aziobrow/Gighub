FactoryBot.define do
  factory :order do

    user
    sequence(:service_address) { |n| "#{n} Fake St." }
    sequence(:purchaser_name) { |n| "Purchaser #{n}" }

  end
end
