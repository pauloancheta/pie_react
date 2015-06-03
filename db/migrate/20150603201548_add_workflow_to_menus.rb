class AddWorkflowToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :workflow_state, :string
  end
end
