class CommentController < ApplicationController
  def create
    c = Comment.create(content: params['content'],  user_id: 1, todo_id: params['todo_id'] )

    if c.valid?
      redirect_to :back
    else
      render plain: 'create comment failed'
    end
  end
end
