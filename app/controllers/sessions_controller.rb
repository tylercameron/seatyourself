class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(session_params[:password])
      log_in user
      # session[:user_id] = user.id
      redirect_to restaurants_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid email or password"
      render "new"
    end

  end

  def destroy
    log_out
    #session[:user_id] = nil
    redirect_to restaurants_url, notice: "Logged out!"
  end

private

def session_params
  params.permit(:email, :password)
end

end
