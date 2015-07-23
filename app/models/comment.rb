class Comment < ActiveRecord::Base
  belongs_to :todo, :polymorphic => true
end
