class Restaurant < ActiveRecord::Base

  # attributes
  attr_accessible :address, :description, :name, :phone, :picture, :category, :capacity
  validates :name, :presence => true

  def opening_hour
    11
  end
  def closing_hour
    20
  end
  def reservation_span
    2.hours
  end
  def reservation_interval
    30.minutes
  end

  # associations
  # belongs_to :category # not actually being used yet
  has_many :reservations

  def time_slots # does not take availability into account
    start_time = Time.zone.now + 10.minutes
    start_time = Time.zone.at( (start_time.to_f / reservation_interval).ceil * reservation_interval ) #round up to nearest half hour
    start_time = [start_time, start_time.change(hour: opening_hour)].max # don't start earlier than opening hours

    end_time = (start_time + 3.days).change(hour: closing_hour)

    all_times = []
    a_time = start_time
    begin
      all_times << a_time
      a_time += reservation_interval
      if (a_time + reservation_span) > a_time.change(hour: closing_hour)
        a_time = (a_time + 1.day).change(hour:opening_hour)
      end
    end while a_time < end_time
    all_times
  end

  def is_available?(begin_time, people)
    # TODO FIX actually this is wrong... if capacity = 10 and there are 7 people for the first hour and 7 for the second, it will say over capacity...
    reserved = self.reservations.where("begin_time <= ?", begin_time).where("end_time >= ?", begin_time + reservation_interval).group('restaurant_id').sum(:people)[self.id].to_i
    self.capacity - (reserved + people) >= 0
  end

end
