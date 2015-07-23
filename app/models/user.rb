class User < ActiveRecord::Base
  has_many :events

  has_many :comments, :dependent => :destroy

  has_many :project_users
  has_many :projects, :through => :project_users

  has_many :team_users
  has_many :teams, :through => :team_users
end
