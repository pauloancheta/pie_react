class AddTimeAvailabilityToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :start_time, :time
    add_column :menus, :end_time, :time
  end
end
