class RemoveFinalDeadlineFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :final_deadline, :datetime
    remove_column :events, :assign_user_id, :integer
  end
end
