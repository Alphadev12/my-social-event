class AvatarsController < ApplicationController
  def create
  	user_id = params[:user_id]
  	@user = User.find(user_id)
  	@user.avatar.attach(params[:avatar])

  	redirect_to(user_path(@user))
  end
end
