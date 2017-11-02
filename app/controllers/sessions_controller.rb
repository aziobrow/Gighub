class SessionsController < ApplicationController

  def new
  end

  def create
    username = params[:session][:username]
    user = User.find_by(username: username)

    if user.nil?
      flash[:danger] = "Couldn't find user #{username}"
      redirect_to login_path
    elsif user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in as #{username}"
      redirect_to dashboard_path
    else
      flash[:danger] = "Incorrect password for #{username}"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    flash[:success] = "Successfully logged out"
    redirect_back(fallback_location: root_path)
  end

end
