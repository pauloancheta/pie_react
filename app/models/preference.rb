class Preference < ActiveRecord::Base
  belongs_to :user
  belongs_to :diet

  has_many :ingredients, through: :filtered_ingredients, dependent: :nullify
  has_many :filtered_ingredients, dependent: :nullify
end
