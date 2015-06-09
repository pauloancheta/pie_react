class CreateFilteredIngredients < ActiveRecord::Migration
  def change
    create_table :filtered_ingredients do |t|
      t.references :preference, index: true
      t.references :ingredient, index: true

      t.timestamps null: false
    end
    add_foreign_key :filtered_ingredients, :preferences
    add_foreign_key :filtered_ingredients, :ingredients
  end
end
