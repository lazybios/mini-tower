class Team < ActiveRecord::Base
  has_many :users
  has_many :teams, :through => :team_users
end
