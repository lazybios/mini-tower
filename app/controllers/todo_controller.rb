class TodoController < ApplicationController

  def index
    @todos = Todo.all.order("finished asc, id desc")
    #查询当前项目下的用户 通过权限控制表
    @users = User.all()
  end

  def create
    t = Todo.create(content: params['content'], finished: 0, user_id: 1, project_id: 1 )

    if t.valid?
      redirect_to root_url
    else
      render plain: 'create task failed'
    end

  end

  def set_deadline
    t = Todo.find(params[:id])

    if t.invalid?
      render plain: 'the task id invalid'
    end

    if t.deadline.blank?
      is_first_assign = true
    else
      is_first_assign = false
      last_deadline = t.deadline
    end
    deadline_time = DateTime.parse(params['deadline'])
    t.deadline = deadline_time

    if t.save
      #current user
      if is_first_assign
        Event.create(event_type: 6, user_id: 1, todo_id: t.id, project_id: t.project_id, final_deadline: t.deadline)
      else
        Event.create(event_type: 6, user_id: 1, todo_id: t.id, project_id: t.project_id, final_deadline: t.deadline, last_deadline: last_deadline)
      end

      redirect_to :back
    else
      render plain: 'modify deadline  faild'
    end

  end

  def assigned
    t = Todo.find(params[:id])
    if t.assign_user_id.blank?
      is_first_assign = true
    else
      is_first_assign = false
      last_assign_user_id = t.assign_user_id
    end

    if t.invalid?
      render plain: 'the task id invalid'
    end

    t.assign_user_id = params['assign']['user_id']

    if t.save
      #current user
      if is_first_assign
        Event.create(event_type: 4, user_id: 1, todo_id: t.id, project_id: t.project_id, assign_user_id: t.assign_user_id)
      else
        Event.create(event_type: 5, user_id: 1, todo_id: t.id, project_id: t.project_id, assign_user_id: t.assign_user_id, last_assign_user_id: last_assign_user_id)
      end

      redirect_to :back
    else
      render plain: 'task assigin faild'
    end

  end

  def destroy
    t = Todo.find(params[:id])
    t.destroy
    redirect_to :root
  end

  def edit
    @todo = Todo.find(params[:id])
    @users = User.all()
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
      #current_user
      Event.create(event_type: 3, user_id: 1, todo_id: t.id, project_id: t.project_id)
      redirect_to root_url
    else
      render plain: 'save to database failed'
    end
  end

  def show
    @todo = Todo.find(params[:id])
    @comments = @todo.comments
  end


end
