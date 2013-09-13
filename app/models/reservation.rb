class Reservation < ActiveRecord::Base

  # attributes
  attr_accessible :begin_time, :end_time, :notes

  after_initialize :set_end_time
  def set_end_time
    if self.begin_time
      self.end_time ||= self.begin_time + 2.hours
    end
  end

  # assocations
  belongs_to :restaurant
  belongs_to :user

end
