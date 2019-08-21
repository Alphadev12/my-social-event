class EventsController < ApplicationController
  include EventsHelper

  before_action :authenticate_user!, only: [:edit, :destroy]
  before_action :is_admin?, only: [:edit, :destroy]
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
      redirect_to new_event_picture_path(@event)
    else
      render :new
    end
  end

  def edit
    event_id = params[:id]
    @event = Event.find(event_id)
    @old_date = @event.start_date

    date_month
    date_day
  end

  def update
    event_id = params[:id]
    @event = Event.find(event_id)

    @start_date = params[:start_date]
    @duration = params[:duration]
    @title = params[:title]
    @description = params[:description]
    @price = params[:price]
    @location = params[:location]

    @event.start_date = @start_date
    @event.duration = @duration
    @event.title = @title
    @event.description = @description
    @event.price = @price
    @event.location = @location

    if @event.save
      flash[:success] = "L'évenement a été bien modifié"
      redirect_to @event
    else
      @old_date = @event.start_date
      render :edit
    end
  end

  def destroy
    event_id = params[:id]
    @event = Event.find(event_id)
    @event.destroy

    redirect_to events_path, :notice => "Un évenement a été supprimé !"
  end

  def is_admin?
    @event = Event.find(params[:id])
    if @event.admin == current_user
      return true
    else
      redirect_to '/'
    end
  end
end
