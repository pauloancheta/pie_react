require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  def valid_attributes (new_attr = {})
    attribute = {
      name: Faker::Company.name,
      address: Faker::Address.street_name,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.phone_number,
      image_url: Faker::Avatar.image
    }
    attribute.merge(new_attr)
  end

  describe "validations" do
    it "requires a restaurant name" do
      restaurant = Restaurant.new(valid_attributes(name: nil))
      expect(restaurant).to be_invalid
    end

    it "requires an address" do
      restaurant = Restaurant.new(valid_attributes(address: nil))
      expect(restaurant).to be_invalid
    end

    it "requires an email address" do
      restaurant = Restaurant.new(valid_attributes(email: nil))
      expect(restaurant).to be_invalid
    end

    it "requires a phone number" do
      restaurant = Restaurant.new(valid_attributes(phone_number: nil))
      expect(restaurant).to be_invalid
    end

    # it "requires an image avatar" do
    #   restaurant = Restaurant.new(valid_attributes(image_url: nil))
    #   expect(restaurant).to be_invalid
    # end
  end

  describe "methods" do
    it "creates a valid #create_from_api" do
      expect{
        Restaurant.create_from_api(valid_attributes)
      }.to change {Restaurant.count}.by(1)
    end

    it "does not create a restaurant with invalid params" do
      expect{
        Restaurant.create_from_api(valid_attributes(name: nil))
      }.to change {Restaurant.count}.by(0)
    end
  end

end
