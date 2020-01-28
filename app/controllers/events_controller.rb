class EventsController < ApplicationController
  before_action :require_login, only: [:create, :new]

  def index
    @events = Event.all
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
    if @user
    session[:user_id] == @user.id
    end
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_url # halts request cycle
    end
  end
end
