class AddAssignUserIdToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :assign_user_id, :integer
  end
end
