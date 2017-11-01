FactoryBot.define do
  factory :item do
    sequence(:title)  {|n| "Product #{n}"}
    sequence(:description)  {|n| "Description #{n}"}
    sequence(:price)  {|n| n}
    image_url "http://placebear.com/50/100"
    category
  end
end
