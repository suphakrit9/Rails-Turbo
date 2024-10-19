class ChangeStatusToBeStringInTasks < ActiveRecord::Migration[7.2]
  def change
    change_column :tasks, :status, :string
  end
end
  