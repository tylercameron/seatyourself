class Reservation < ApplicationRecord
  validates :date_of_reservation, :time_of_reservation, :number_of_seats, presence: true
  validates :number_of_seats, numericality: {only_integer: true}

  belongs_to :user
  belongs_to :restaurant
end
