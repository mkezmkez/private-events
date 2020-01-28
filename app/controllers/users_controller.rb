class UsersController < ApplicationController

  def index
  end
  
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @upcoming_events = @user.attended_events.upcoming_events
    @previous_events = @user.attended_events.previous_events
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :username)
  end

end
