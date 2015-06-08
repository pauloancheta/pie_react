FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| " #{Faker::Name.name}-#{n}"}
    email Faker::Internet.email
    password Faker::Internet.password
  end  
end