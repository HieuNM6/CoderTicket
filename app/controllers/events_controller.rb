class EventsController < ApplicationController
  def index
    if params[:search]
      @events = Event.event_searches_by_name(params[:search])
    else
      @events = Event.upcomming_events
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
