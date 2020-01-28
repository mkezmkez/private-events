class EventsController < ApplicationController
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
    params.require(:event).permit(:description)
  end
end
