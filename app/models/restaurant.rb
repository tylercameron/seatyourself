class Restaurant < ActiveRecord::Base
  belongs_to :category
  has_many :reservations
  attr_accessible :address, :description, :name, :phone, :picture, :category, :capacity

  def is_available?(begin_time, end_time)
    reservations = Reservation.where(:begin_time => begin_time, :end_time => end_time)
    return reservations.count < self.capacity    
  end
end
