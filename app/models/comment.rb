class Comment < ActiveRecord::Base
  has_many :events, :dependent => :destroy

  belongs_to :todo, :polymorphic => true
  belongs_to :user

  after_create :create_envent

  private

  def create_envent
    todo = Todo.find(self.todo_id)
    Event.create(event_type: 7, comment_id: self.id, user_id: self.user_id, todo_id: self.todo_id, project_id: todo.project_id)
  end

end
