class Reservation < ApplicationRecord
  validates :date, :time, :number_of_seats, presence: true
  validates :number_of_seats, numericality: {only_integer: true}

  belongs_to :user
  belongs_to :restaurant
end
