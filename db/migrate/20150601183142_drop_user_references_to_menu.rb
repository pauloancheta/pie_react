class DropUserReferencesToMenu < ActiveRecord::Migration
  def change
    remove_column :menus, :user_id
  end
end
