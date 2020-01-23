class EventsController < ApplicationController
  
  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true)
    @events_show = Event.all
  end

  def show
    @event = Event.find(params[:id])
    # binding.pry
    gon.lat = @event.latitude
    gon.lng = @event.longitude
  end
  
  def new
    @event = Event.new
    3.times { @event.images.build }
  end
  
  def create
    # binding.pry
    @event = Event.create(event_params)
    @event.organaizer = current_user.id
    @event.user_events.build(user_id: current_user.id)
    binding.pry
    if @event.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    binding.pry
    # @event.images.build
    # unless @event.images.blank?
    #   @event.images.each do |image|
    #     image.image.cache!
    #   end
    # end 
    # @event.images.count.times { @event.images.build }
  end
  
  def update
    @event = Event.find(params[:id])
    binding.pry
    if @event.update(update_event_params)
      binding.pry
      redirect_to event_path(@event)
    else
      render action: :edit
    end
  end
  
  def search
    @q = Event.search(search_params)
    @events = @q.result(distinct: true) 
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
    @event = Event.find(params[:id])
    @people = @event.users.count
    respond_to do |format|
      format.js
    end
  end

  def exit_study_group
    event = UserEvent.where(user_id: current_user, event_id: params[:id]).first
    event.destroy
    @event = Event.find(params[:id])
    @people = @event.users.count
    respond_to do |format|
      format.js
    end
  end

  private

  def search_params
    params.require(:q).permit!
  end

  def event_params
    params.require(:event).permit(:title, :address, :start_time, :end_time, :capacity, :description, :user_id, :content_list, :image_cache, images_attributes: [:image])
  end

  def update_event_params
    params.require(:event).permit(:title, :address, :start_time, :end_time, :capacity, :description, :user_id, :content_list, :image_cache, images_attributes: [:image, :_destroy, :id])
  end
end