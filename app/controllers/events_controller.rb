class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    event_id = params[:id]
    @event = Event.find(event_id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
