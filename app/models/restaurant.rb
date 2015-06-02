class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :menus

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :image_url, presence: true

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
