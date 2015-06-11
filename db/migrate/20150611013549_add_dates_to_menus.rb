class AddDatesToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :start_date, :date
    add_column :menus, :end_date, :date
  end
end
