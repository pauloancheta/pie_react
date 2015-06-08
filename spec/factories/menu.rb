FactoryGirl.define do
  factory :menu do
    sequence(:name) { |n| " #{Faker::Company.name}-#{n}"}
    price Faker::Number.number(2)
    description Faker::Company.bs
  end  
end