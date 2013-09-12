class Reservation < ActiveRecord::Base

  # attributes
  attr_accessible :begin_time, :end_time, :notes

  # assocations
  belongs_to :restaurant
  belongs_to :user

end
