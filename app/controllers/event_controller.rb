class EventController < ApplicationController
  def index
    #ToFix: 修改为当前项目的event
    @events = Event.all()
  end
end
