class AddRestaurantIdToMenus < ActiveRecord::Migration
  def change
    add_reference :menus, :restaurant, index: true
    add_foreign_key :menus, :restaurants
  end
end
