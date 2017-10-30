FactoryBot.define do
  factory :item do
    sequence(:title)  {|n| "Product #{n}"}
    sequence(:description)  {|n| "Description #{n}"}
    sequence(:price)  {|n| "Price: $#{n}"}
    image "http://placebear.com/50/100"
  end
end
