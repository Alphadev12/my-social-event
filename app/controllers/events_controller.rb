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
    @start_date = params[:start_date]
    @duration = params[:duration]
    @title = params[:title]
    @description = params[:description]
    @price = params[:price]
    @location = params[:location]

    @event = Event.new(
      start_date: @start_date,
      duration: @duration,
      title: @title,
      description: @description,
      price: @price,
      location: @location
    )

    @event.admin = current_user

    if @event.save
      flash[:success] = "L'évenement a été bien ajouter"
      redirect_to @event
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
