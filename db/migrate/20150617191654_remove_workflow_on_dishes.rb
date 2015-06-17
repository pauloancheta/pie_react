class RemoveWorkflowOnDishes < ActiveRecord::Migration
  def change
    remove_column :dishes, :workflow_state
  end
end
