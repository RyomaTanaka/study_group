class TopController < ApplicationController
  def index
    @events = Event.all
    @users = User.all.where.not(id: current_user.id)
  end
end
