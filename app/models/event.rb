class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  belongs_to :todo
end
