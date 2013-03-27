class SessionsController < ApplicationController
  def create
    user = User.where(:email => params[:email]).first
    if user && user.authenticate(params[:password])
      current_user = user
      redirect_to root_path
    else
      redirect_to new_session_path, alert: "Please try again."
    end
  end

  def destroy
  end

  def new
  end

end
