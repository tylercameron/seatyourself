require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  test "when restaurant is full, it should not be available for reservation" do
    reservation = FactoryGirl.create(:reservation)
    restaurant = reservation.restaurant
    restaurant.capacity = 1

    #binding.pry

    begin_time = Time.zone.parse("1980-01-01 17:00:00")
    end_time = Time.zone.parse("1980-01-01 18:00:00")

    refute restaurant.is_available?(begin_time, end_time)
  end

  test "when restaurant has room, it should not be available for reservation" do
    reservation = FactoryGirl.create(:reservation)
    restaurant = reservation.restaurant
    restaurant.capacity = 1

    begin_time = Time.zone.parse("1980-01-01 19:00:00")
    end_time = Time.zone.parse("1980-01-01 20:00:00")

    assert restaurant.is_available?(begin_time, end_time)
  end
end
