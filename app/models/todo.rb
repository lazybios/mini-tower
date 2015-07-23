class Todo < ActiveRecord::Base
  has_many :events

  has_many :comments, :dependent => :destroy
  belongs_to :project

  after_create :create_event_1
  after_destroy :create_event_2

  def create_event_1
    Event.create(event_type: 1, user_id: self.user_id, todo_id: self.id, project_id: self.project_id)
  end

  def create_event_2
    Event.create(event_type: 2, user_id: self.user_id, todo_id: self.id, project_id: self.project_id)
  end

end
