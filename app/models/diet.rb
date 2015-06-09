class Diet < ActiveRecord::Base
  has_many :dishes, through: :dish_diet, dependent: :nullify
  has_many :dish_diet, dependent: :destroy

  has_many :preference, dependent: :nullify
  has_many :users, through: :preference, dependent: :nullify
end
