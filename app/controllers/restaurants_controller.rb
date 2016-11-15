class RestaurantsController < ApplicationController
  def index
      @restaurants = Restaurant.all
      if params[:search]
      @restaurants = Restaurant.search(params[:search]).order("created_at DESC")
    else
      @restaurants = Restaurant.all.order('created_at DESC')
    end
  end

def edit
  @restaurant = Restaurant.find(params[:id])
end

def new
  @restaurant = Restaurant.new
end

def show
  @restaurant = Restaurant.find(params[:id])

  if current_user
    @reservation = @restaurant.reservations.build
  end

end

def create
  @restaurant = Restaurant.new(restaurant_params)
  if @restaurant.save
    redirect_to restaurants_url
  else
    render :new
  end
end

def destroy
  @restaurant = Restaurant.find(params[:id])
  @restaurant.destroy
  redirect_to restaurants_url
end

def update
  @restaurants = restaurant.find(restaurant[:id])
  if @restaurant.update_attributes(restaurant_params)
    redirect_to restaurant_url(@restaurant)
  else
    render :edit
  end
end

private

<<<<<<< HEAD
def restaurant_params
  params.require(:restaurant).permit(:name, :description, :cuisine, :price, :street_address, :neighbourhood, :phone, :image)
end
=======
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :cuisine, :price, :street_address, :neighbourhood, :phone, :capacity)
  end
>>>>>>> 00a911db3c4aa8a52d7241a4c520ec7ea74d69bc
end
