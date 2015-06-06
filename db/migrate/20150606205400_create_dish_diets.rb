class CreateDishDiets < ActiveRecord::Migration
  def change
    create_table :dish_diets do |t|
      t.references :dish, index: true
      t.references :diet, index: true

      t.timestamps null: false
    end
    add_foreign_key :dish_diets, :dishes
    add_foreign_key :dish_diets, :diets
  end
end
