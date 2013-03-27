class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    if user.nil?
      session.delete(:user_id)
    else
      session[:user_id] = user.id
    end
  end

  helper_method :current_user

end
