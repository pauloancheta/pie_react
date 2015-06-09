class Ingredient < ActiveRecord::Base
  has_many :filtered_ingredients, dependent: :nullify
  has_many :preferences, dependent: :nullify
end
