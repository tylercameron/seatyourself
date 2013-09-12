class Restaurant < ActiveRecord::Base

  # attributes
  attr_accessible :address, :description, :name, :phone, :picture, :category, :capacity
  validates :name, :presence => true

  # associations
  belongs_to :category
  has_many :reservations

  def is_available?(begin_time, end_time)
    reservations = Reservation.where(:begin_time => begin_time, :end_time => end_time)
    return reservations.count < self.capacity    
  end

end
