class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @organize_events = current_user.events.where(organaizer: current_user.id)
    @participate_events = current_user.events.where.not(organaizer: current_user.id)
  end
end
