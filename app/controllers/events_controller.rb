class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to '/events'
    else
      render 'new'
    end
  end

  private
    def event_params
      params.require(:event).permit(:title, :location, :occurs_on)
    end

    def event_find
      Event.find(params[:id])
    end
end
