class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update add_study_group exit_study_group]
  before_action :authenticate_user!, except: %i[index show search map]

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true)
    @events_show = Event.all
  end

  def show
    gon.lat = @event.latitude
    gon.lng = @event.longitude
  end

  def new
    @event = Event.new
    3.times { @event.images.build }
  end

  def create
    @event = Event.create(event_params)
    @event.organaizer = current_user.id
    @event.user_events.build(user_id: current_user.id)
    if @event.save
      redirect_to root_path, notice: "イベントが作成されました。"
    else
      3.times { @event.images.build }
      render action: :new
    end
  end

  def edit; end

  def update
    if @event.update(update_event_params)
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
    @people = @event.users.count
    respond_to do |format|
      format.js
    end
  end

  def exit_study_group
    UserEvent.find_by(user_id: current_user.id, event_id: params[:id]).destroy
    @people = @event.users.count
    respond_to do |format|
      format.js
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def search_params
    params.require(:q).permit!
  end

  def event_params
    params.require(:event).permit(:title, :address, :start_time, :end_time, :capacity, :description, :user_id, :content_list, :image_cache, images_attributes: [:image])
  end

  def update_event_params
    params.require(:event).permit(:title, :address, :start_time, :end_time, :capacity, :description, :user_id, :content_list, :image_cache, images_attributes: %i[image _destroy id])
  end
end
