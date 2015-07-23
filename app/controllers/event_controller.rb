class EventController < ApplicationController
  def index
    #ToFix: 修改为当前项目的event
    if params.has_key?(:offset)
      offset = params[:offset]
    else
      offset = 50
    end
    @events = Event.all().order('created_at desc').take(offset)
  end
end
