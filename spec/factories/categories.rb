FactoryBot.define do
  factory :category do
    sequence(:name) {|n| "Category #{name}"}
  end
end
