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
      redirect_to events_path
    else
      render 'new'
    end
  end

  def edit
    @event = event_find
  end

  def update
    @event = event_find
    if @event.update(event_params)
      redirect_to events_path
    else
      render 'edit'
    end
  end

  def destroy
    @event = event_find
    @event.destroy
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:title, :location, :occurs_on, :description, :url)
    end

    def event_find
      Event.find(params[:id])
    end
end
