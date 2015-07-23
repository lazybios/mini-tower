class Project < ActiveRecord::Base
  has_many :todos

  has_many :project_users
  has_many :users, :through => :project_users

  has_many :accesses
  has_many :users, :through => :accesses

end
