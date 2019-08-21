class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_current?, only: [:show]
  def index
  end

  def show
    user_id = params[:id]
    @user = User.find(user_id)
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

  def is_current?
    @user = User.find(params[:id])
    if @user == current_user
      return true
    else
      redirect_to current_user
    end
  end
end
