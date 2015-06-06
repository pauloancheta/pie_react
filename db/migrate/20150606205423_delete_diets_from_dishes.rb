class DeleteDietsFromDishes < ActiveRecord::Migration
  def change
    remove_column :dishes, :primary_diet
    remove_column :dishes, :optional_diet

    remove_column :users, :diet
  end
end
