class Dish < ActiveRecord::Base
  belongs_to :menu

  def self.create_from_api(response)
    dish = Dish.new_from_api(response)
    dish.save
  end

  private

  def self.new_from_api(response)
    Dish.new(
      name: response[:name],
      price: response[:price],
      description: response[:description],
      menu_id: response[:menu_id]
    )
  end
end
