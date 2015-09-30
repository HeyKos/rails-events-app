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
    # Add category mappings
    unless params[:categories].blank?
      @event.categories << Category.find(params[:categories])
    end
    # Assign the current user to the event
    if current_user
      @event.user_id = current_user.id
    end
    # Add tags
    unless params[:tag_list].blank?
      @event.tag_list.add(params[:tag_list], parser: SpaceParser)
    end
    if @event.save
      EventMailer.event_created_email(@event).deliver_now
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
    p = params[:event]
    @event.title = p[:title]
    @event.description = p[:description]
    @event.occurs_on = p[:occurs_on]
    @event.url = p[:url]
    @event.location = p[:location]
    # Reset categories
    @event.categories = []
    # Add category assigments
    unless params[:categories].blank?
      @event.categories << Category.find(params[:categories])
    end
    # Reset tags
    @event.tag_list = ""
    # Add tags
    unless params[:tag_list].blank?
      @event.tag_list.add(params[:tag_list], parser: SpaceParser)
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
      params.require(:event).permit(:title, :location, :occurs_on, :description, :url, :categories, :tag_list)
    end

    def event_find
      Event.find(params[:id])
    end
end
