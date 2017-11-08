FactoryBot.define do
  factory :order do

    user
    sequence(:original_address) { |n| "#{n} Fake St." }

  end
end
