class SessionsController < ApplicationController

  def new
  end

  def create
    username = params[:session][:username]
    user = User.find_by(username: username)

    if user.nil?
      # flash[:error] = "Couldn't find user #{username}."
      # redirect_to login_path
    elsif user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      # flash[:error] = "Incorrect password for #{username}."
      # redirect_to login_path
    end
  end

end
