class Reservation < ActiveRecord::Base

  # attributes
  attr_accessible :begin_time, :end_time, :notes

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

  after_initialize :set_end_time
  def set_end_time
    if self.begin_time
      self.end_time ||= self.begin_time + reservation_span
    end
  end

  # assocations
  belongs_to :restaurant
  belongs_to :user

  def available_times
    # so far, does NOT check whether the restaurant is at capacity

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

end
