class EventsController < ApplicationController
  before_action :require_login, only: [:new]

  def index
    @events = Event.all
    @upcoming = @events.where(date: (Time.now-1.year)..(Time.now-3600))
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.new(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :date, :title, :location, :image)
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_url
    end
  end
end
