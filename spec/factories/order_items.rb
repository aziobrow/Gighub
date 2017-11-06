FactoryBot.define do
  factory :order_item do

    order
    item
    sequence(:quantity) { |n| n }

  end
end
