class ReservationsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to @reservation.user, :notice => 'reservation made'
    else
      render 'restaurants/show'
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:begin_time, :notes, :people)
  end
end
