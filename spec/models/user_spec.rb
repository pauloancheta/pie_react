require 'rails_helper'

RSpec.describe User, type: :model do
  def validation_attributes(new_atributes = {})
    password = Faker::Internet.password
    valid_atributes = {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password
    }
    valid_atributes.merge(new_atributes)
  end 

  it "reqiures a name" do
    user = User.new(validation_attributes({name: nil}))
    expect(user).to be_invalid
  end

  it "requires an email" do
    user = User.new(validation_attributes({email: nil}))
    expect(user).to be_invalid
  end

  it "requires a unique email" do
    first_user = User.create(validation_attributes({email: "some@email.com"}))
    user = User.new(validation_attributes({email: "some@email.com"}))
    expect(user).to be_invalid
  end

  it "requires a password" do
    user = User.new(validation_attributes({password: nil}))
    expect(user).to be_invalid
  end

  it "requires a password confirmation" do
    user = User.new(validation_attributes({password_confirmation: nil}))
    expect(user).to be_invalid
  end

  it "generates a password_digest" do
    user = User.new(validation_attributes)
    expect(user.password_digest).to be
  end
end
