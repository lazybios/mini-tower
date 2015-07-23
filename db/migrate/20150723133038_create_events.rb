class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :event_type
      t.integer :todo_id
      t.integer :last_assign_user_id
      t.integer :assign_user_id
      t.datetime :last_deadline
      t.datetime :final_deadline

      t.timestamps
    end
  end
end
