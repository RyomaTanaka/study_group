class TopController < ApplicationController
  def index
    @events = Event.all
    @users = User.all
  end
end
