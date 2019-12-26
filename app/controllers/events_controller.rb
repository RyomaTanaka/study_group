class EventsController < ApplicationController
  def new
    @event = Event.new
    3.times { @event.images.build }
  end
  
  def create
    binding.pry
    @event = Event.create(event_params)
    @event.user_events.build(user_id: current_user.id)
    @event.save
    redirect_to root_path
  end

  def show
    @event = Event.find(params[:id])
    gon.lat = @event.latitude
    gon.lng = @event.longitude
  end

  def map
    results = Geocoder.search(params[:place])
    @latlng = results.first.coordinates

    respond_to do |format|
      format.js
    end
  end

  def add_study_group
    UserEvent.create(user_id: current_user.id, event_id: params[:id])
    redirect_to event_path(params[:id])
  end

  def exit_study_group
    event = UserEvent.where(user_id: current_user, event_id: params[:id]).first
    event.destroy
    redirect_to event_path(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :address, :start_time, :end_time, :capacity, :description, :user_id, :content_list, images_attributes: [:image])
  end
end