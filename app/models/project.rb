class Project < ActiveRecord::Base
  has_many :todos
  has_many :project_users
  has_many :users, :through => :project_users
end
