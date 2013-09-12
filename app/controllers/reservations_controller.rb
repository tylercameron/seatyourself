class ReservationsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(params[:reservation])
    @reservation.user = current_user
    if @reservation.save
      redirect_to @reservation.user, :notice => 'reservation made'
    else
      render 'restaurants/show'
    end
  end

end
