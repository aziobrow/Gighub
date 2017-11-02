FactoryBot.define do
  factory :order_item do

    order
    item
    sequence(:cost) { |n| n }
    sequence(:quantity) { |n| n }

  end
end
