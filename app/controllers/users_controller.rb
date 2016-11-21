class UsersController < ApplicationController

  def new
  @user = User.new
  end

def create
  @user = User.new(user_params)
  #@restaurant = Restaurant.find(params[:restaurant_id])
  if @user.save
    flash[:notice] = "Yo signed up!"
    log_in @user
    redirect_to restaurants_url(route_params[:restaurant_id])
  else
    flash[:notice] = "Try again yo!"
    render "new"
  end
end

def show
  @user = User.find(params[:id])
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])

  if @user.update_attributes(user_params)
    flash[:notice] = "Yo up to date!"
    redirect_to user_url(@user)
  else
    flash[:notice] = "Try again yo!"
    render :edit
  end
end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :phone)
  end

  def route_params
    params.require(:user).permit(:restaurant_id)
  end

end
