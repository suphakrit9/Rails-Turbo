class AddCompletedToTodos < ActiveRecord::Migration[7.2]
  def change
    add_column :todos, :completed, :boolean
  end
end
