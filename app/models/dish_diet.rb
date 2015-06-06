class DishDiet < ActiveRecord::Base
  belongs_to :dish
  belongs_to :diet
end
