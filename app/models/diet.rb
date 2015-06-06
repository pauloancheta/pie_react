class Diet < ActiveRecord::Base
  has_many :dishes, through: :dish_diet, dependent: :nullify
  has_many :dish_diet, dependent: :destroy
end
