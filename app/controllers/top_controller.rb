class TopController < ApplicationController
  def index
    @events = Event.all
    if user_signed_in?
      @users = User.all.where.not(id: current_user.id)
    else
      @users = User.all
    end
  end
end
