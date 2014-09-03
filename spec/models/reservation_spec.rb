require 'rails_helper'

describe Reservation do
	let!(:reservation) { FactoryGirl.create(:reservation) }

	it "must not allow reservations beyond restaurant capacity" do
		reservation.people = reservation.restaurant.capacity + 1
		reservation.should_not be_valid
	end

	it "must allow reservations within restaurant capacity" do
		reservation.people = [reservation.restaurant.capacity - 1, 1].max # ensures not asking for zero people
		reservation.should be_valid
	end

	# todo: tests which test going over the capacity via multiple reservations (?)

end
