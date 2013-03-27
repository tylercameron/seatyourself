class SessionsController < ApplicationController
  def create
    user = User.where(:email => params[:email]).first
    if user && user.authenticate(params[:password])
      self.current_user = user
      redirect_to root_path, notice: "Welcome #{user.name}!"
    else
      redirect_to new_session_path, alert: "Please try again."
    end
  end

  def destroy
    self.current_user = nil
    redirect_to root_path, notice: "You are now signed out."
  end

  def new
  end

end
