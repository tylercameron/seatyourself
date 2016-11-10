class ReservationsController < ApplicationController
	def index
		@reservations = Reservation.all
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(reservation_params)

			if @reservation.save
				redirect_to reservations_url
			else
				render :new
			end
	end

	def update
		@reservation = Reservation.find(params[:id])

			if @reservation.update_attributes(reservation_params)
				redirect_to reservation_url(@reservation)
			else
				render :edit
			end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to reservations_url
	end

	private
	def reservation_params
		params.require(:reservation).permit(:date, :time, :number_of_seats)
	end
end
