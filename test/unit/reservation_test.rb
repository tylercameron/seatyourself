require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  test "reservations should not be available if it would make the restaurant beyond capacity" do
    reservation = FactoryGirl.create(:reservation)
    restaurant = reservation.restaurant
    begin_time = Time.zone.parse("1980-01-01 17:00:00")
    refute restaurant.is_available?(begin_time, restaurant.capacity + 1)
  end

  test "reservations should be available if it would not make the restaurant beyond capacity" do
    reservation = FactoryGirl.create(:reservation)
    restaurant = reservation.restaurant
    begin_time = Time.zone.parse("1980-01-01 19:00:00")
    assert restaurant.is_available?(begin_time, restaurant.capacity - 1)
  end
end
