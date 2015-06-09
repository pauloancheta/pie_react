class FilteredIngredient < ActiveRecord::Base
  belongs_to :preference
  belongs_to :ingredient
end
