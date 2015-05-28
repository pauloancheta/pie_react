class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :price
      t.string :description
      t.references :menu, index: true

      t.timestamps null: false
    end
    add_foreign_key :dishes, :menus
  end
end
