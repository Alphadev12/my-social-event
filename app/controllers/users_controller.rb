class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
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
end
