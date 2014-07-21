class RestaurantsController < ApplicationController

  def index
    @restaurants = if params[:search]
      Restaurant.near(params[:search], 1, units: :km)
    elsif params[:longitude] && params[:latitude]
      Restaurant.near([params[:latitude], params[:longitude]], 1, units: :km)
    else
      Restaurant.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservation = @restaurant.reservations.build
    @nearby_restaurants = @restaurant.nearbys(1, units: :km)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_url
    else
      render :new
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:address, :description, :name, :phone, :picture, :category, :capacity)
  end
end
