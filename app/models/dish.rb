class Dish < ActiveRecord::Base
  belongs_to :menu
  has_many :dish_diets, dependent: :destroy
  has_many :diets, through: :dish_diets, dependent: :nullify
  has_many :dish_extras, dependent: :destroy
end
