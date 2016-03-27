class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  def index
    if params[:search]
      @events = Event.event_searches_by_name(params[:search])
    else
      @events = Event.upcomming_events
    end
  end

  def event_list
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.new
    initialize_show_vars
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      flash[:success] = "Event has created"
      redirect_to root_path
    else
      flash.now[:error] = "Event hasn't created"
      initialize_show_vars
      render :action => 'new'
    end
  end
  
  def edit
    @event = Event.find(params[:id])
    initialize_show_vars
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Event has updated"
      redirect_to event_list_path
    else
      flash.now[:error] = "Event hasn't updated"
      initialize_show_vars
      render 'edit'
    end
  end
  private
    def event_params
      params.require(:event).permit!
    end

    def initialize_show_vars
      @categorys = Category.all
      @hash_events = (Venue.ids).zip(Venue.names).to_h
    end
end
