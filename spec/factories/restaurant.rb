FactoryGirl.define do
  factory :restaurant do
    sequence(:name) { |n| " #{Faker::Company.name}-#{n}"}
    address Faker::Address.street_address
    phone_number Faker::PhoneNumber.phone_number
    image_url Faker::Avatar.image
  end  
end