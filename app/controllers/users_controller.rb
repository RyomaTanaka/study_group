class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def search
    @q = User.search(search_params)
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @organize_events = current_user.events.where(organaizer: current_user.id)
    @participate_events = current_user.events.where.not(organaizer: current_user.id)
  end

  private

  def search_params
    params.require(:q).permit!
  end
end
