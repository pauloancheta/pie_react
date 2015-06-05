class AddDietToUsers < ActiveRecord::Migration
  def change
    add_column :users, :diet, :string
  end
end
