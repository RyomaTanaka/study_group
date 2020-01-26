class TopController < ApplicationController
  def index
    @events = Event.all
    @users = if user_signed_in?
               User.all.where.not(id: current_user.id)
             else
               User.all
             end
  end
end
