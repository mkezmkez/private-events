class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user ||= nil
    @user ||= User
      .find_by(session_params
        .reject { |_k, v| v.empty? }.keys.first || :name => session_params.reject { |_k, v| v.empty? }.values.first)
    @user ||= User
      .find_by(session_params
        .reject { |_k, v| v.empty? }.keys.last || :username => session_params.reject { |_k, v| v.empty? }.values.last)

    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = 'Wrong information, try again'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:name, :username, :email)
  end
end
