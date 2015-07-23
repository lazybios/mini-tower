class TodoController < ApplicationController

  def index
    @todos = Todo.all.order("finished asc, id asc")
  end

  def create

    t = Todo.create(content: params['content'], finished: 0, user_id: 1, project_id: 1 )

    if t.valid?
      redirect_to root_url
    else
      render plain: 'create task failed'
    end
  end

  def destroy
    t = Todo.find(params[:id])
    t.destroy
    redirect_to :root
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    t = Todo.find(params[:id])
    if t.invalid?
      render plain: 'the task id invalid'
    end

    if params[:content].empty?
      render plain: 'the content can not be empty'
      return
    end

    t.update(content: params[:content])
    redirect_to root_url
  end

  def finished
    #参数检查
    t = Todo.find(params[:id])
    if t.invalid?
      render plain: 'the task id invalid'
    end

    if params[:status] == 'yes'
      t.finished = 1
    elsif params[:status] == 'no'
      t.finished = 0
    else
      render plain: 'status parameter invalid'
    end

    if t.save
      # 通知事件
      redirect_to root_url
    else
      render plain: 'save to database failed'
    end
  end

  def show
    @todo = Todo.find(params[:id])
    @comments =  Comment.where(todo_id: @todo.id)
  end


end
