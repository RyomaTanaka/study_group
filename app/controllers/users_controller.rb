class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @organize_events = @user.events.where(organaizer: @user.id)
    @participate_events = @user.events.where.not(organaizer: @user.id)
  end

  def search
    @q = User.search(search_params)
    @users = @q.result(distinct: true)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render action: :edit
    end
  end

  private

  def search_params
    params.require(:q).permit!
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :icon, :introduction)
  end
end
