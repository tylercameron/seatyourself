class Restaurant < ActiveRecord::Base

  validates :name, :presence => true

  belongs_to :category # not actually being used yet
  has_many :reservations

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # These methods return the opening and closing hours for a restaurant
  # A possible new feature would be to make these additional columns so that each restaurant could have its own hours
  def opening_hour
    11 # i.e. 11:00 AM
  end

  def closing_hour
    20 # i.e. 8:00 PM
  end

  # ASSUMPTIONS
  # These assumptions are required in order for the code below to make sense
  # Assumption 1: you can only book by the hour; e.g. 3pm, 4pm, but not 3:30pm nor 3:17pm
  # Assumption 2: everyone arrives on time and leaves exactly one hour after they arrived
  # If we did not make these assumptions, we would have to do a lot more time calculations

  # This method will return a list of times in which a reservation can be made
  # Specifically, it will return a list of times
  # We will allow making reservations for the same day and several days beyond
  def time_slots # does not take availability into account

    # you can book by the hour, and you can stay for an hour
    reservation_interval = 1.hour

    # Determine the earliest time we will allow reservation
    # It can't be in the past, we'll start 10 minutes from now
    start_time = Time.zone.now + 10.minutes
    # Then we have to round to the next hour block
    start_time = Time.zone.at( (start_time.to_f / reservation_interval).ceil * reservation_interval )
    # Then, if we are still earlier than opening hour, just use the opening hour
    # We can use the 'max' Array method
    start_time = [start_time, start_time.change(hour: opening_hour)].max

    # Determine the furthest in the future we will allow reservations
    end_time = (start_time + 3.days).change(hour: closing_hour)

    # Now, we want to make a list of every hour between our start_time and our end_time
    # For this we can use a begin... end while condition loop.
    # We'll start with an empty array that will hold all the hours,
    #   and a variable to hold each hour, which we will keep increasing by 1 hour, and then add to our array
    # Our loop condition will have us stop looping once we've reached the end time

    all_times = []
    a_time = start_time

    begin

      # add this time to our list of times
      all_times << a_time

      # increment the time
      a_time += reservation_interval

      # Once we get to closing time, we have to skip ahead to the next day's opening
      # That way you can't make a reservation at 2am
      if (a_time + reservation_interval) > a_time.change(hour: closing_hour)
        a_time = (a_time + 1.day).change(hour:opening_hour)
      end

    end while a_time < end_time

    all_times
  end

  # Returns true or false, depending on whether there is room for a certain number of people at a certain time
  def is_available?(begin_time, people)
    # find out how many people have already made a reservation by adding up all the people from all the reservations in that time slot
    reserved = self.reservations.where(:begin_time, begin_time).sum(:people)
    # now add in the number of people in the requested reservation and see if they fit
    self.capacity - (reserved + people) >= 0
  end

end
