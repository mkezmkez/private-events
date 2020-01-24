class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user ||= User.find_by(session_params.select{ |k,v| !v.empty? }.keys.first => session_params.select{ |k,v| !v.empty? }.values.first)
    @user ||= User.find_by(session_params.select{ |k,v| !v.empty? }.keys.second => session_params.select{ |k,v| !v.empty? }.values.second)
    @user ||= User.find_by(session_params.select{ |k,v| !v.empty? }.keys.last => session_params.select{ |k,v| !v.empty? }.values.last)
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:name, :username, :email)
  end

end
