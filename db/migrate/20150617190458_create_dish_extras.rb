class CreateDishExtras < ActiveRecord::Migration
  def change
    create_table :dish_extras do |t|
      t.references :dish, index: true
      t.string :description

      t.timestamps null: false
    end
    add_foreign_key :dish_extras, :dishes
  end
end
