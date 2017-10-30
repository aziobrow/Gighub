FactoryBot.define do
  factory :item do
    sequence(:title)  {|n| "Product #{n}"}
    sequence(:description)  {|n| "Description #{n}"}
    sequence(:price)  {|n| "Price: $#{n}"}
    image_url { "http://placebear.com/#{rand(175..225)}/#{rand(275..325)}" }
  end
end
