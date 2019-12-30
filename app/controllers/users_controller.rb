class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @event = current_user.events
  end
end
