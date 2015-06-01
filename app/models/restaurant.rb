class Restaurant < ActiveRecord::Base
  belongs_to :user

  def self.create_from_api(response)
    restaurant = Restaurant.new_from_api(response)
    restaurant.save
    restaurant
  end

  private

  def self.new_from_api(response)
    Restaurant.new(
      name: response[:name],
      address: response[:address],
      email: response[:email],
      phone_number: response[:phone_number],
      image_url: response[:image_url]
    )
  end
end
