class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    unless params[:categories].blank?
      @event.categories << Category.find(params[:categories])
    end
    if current_user
      @event.user_id = current_user.id
    end
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
    @event.attributes = params[:event]
    unless params[:categories].blank?
      @event.category_ids = params[:categories]
    end
    if @event.save
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
