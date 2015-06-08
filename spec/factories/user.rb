FactoryGirl.define do
  pass = Faker::Internet.password
  factory :user do
    sequence(:name) { |n| " #{Faker::Name.name}-#{n}"}
    email Faker::Internet.email
    password pass
    password_confirmation pass
  end  
end