class AddDietsToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :primary_diet, :string
    add_column :dishes, :optional_diet, :string
  end
end
