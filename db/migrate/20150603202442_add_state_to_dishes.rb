class AddStateToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :workflow_state, :string
  end
end
