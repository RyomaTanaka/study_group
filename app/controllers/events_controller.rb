class EventsController < ApplicationController
  def new
    @event = Event.new
    5.times { @event.images.build }
  end

  def create
    @event = Event.create(event_params)
    @event.save
    redirect_to root_path
  end

  def show
  end

  def map
    results = Geocoder.search(params[:place])
    @latlng = results.first.coordinates
    # binding.pry

    respond_to do |format|
      format.js
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :place, :start_time, :end_time, :description, images_attributes: [:image])
  end
end