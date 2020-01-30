class EventsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @events = Event.all
    @past_events = @events.where(date: (Time.now - 1.year)..(Time.now - 3600))
    @upcoming_events = @events.where(date: (Time.now - 3600)..(Time.now + 1.year))
    @event_image = "https://i.picsum.photos/id/#{rand(1...100)}/200/300.jpg"
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
    @event = Event.new
    render :new
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
    return if logged_in?

    flash[:error] = 'You must be logged in to access this section'
    redirect_to new_session_url
  end
end
