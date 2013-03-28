class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  attr_accessible :begin_time, :end_time, :notes
end
