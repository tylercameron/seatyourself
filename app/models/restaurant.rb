class Restaurant < ApplicationRecord

  # validates :name, :description, :cuisine, :price, :street_address, :neighbourhood, :phone, :image, presence: true
  # validates :phone, numericality: {only_integer: true}

  has_many :reservations
  has_many :users, through: :reservations

  def self.search(search)
    # Restaurant.fuzzy_search(search)
    where("cuisine ILIKE ?", "%#{search}%")
     .or(where("name ILIKE ?", "%#{search}%"))
     .or(where("description ILIKE ?", "%#{search}%"))
     .or(where("cuisine ILIKE ?", "%#{search}%"))
     .or(where("price ILIKE ?", "%#{search}%"))
     .or(where("street_address ILIKE ?", "%#{search}%"))
     .or(where("neighbourhood ILIKE ?", "%#{search}%"))
  end

  def available (number_of_seats, time, restaurant_id)
    number_of_seats > 0 && available_capacity(time, restaurant_id) >= number_of_seats
  end

  private

  def available_capacity(time, restaurant_id)
    Restaurant.where(id: restaurant_id).first.capacity - reservations_at(time).sum(:number_of_seats)
    # available_capacity - reservations_at(time).sum(:number_of_seats)
  end

  def reservations_at(time)
    reservations.where(time_of_reservation: time.beginning_of_hour..time.end_of_hour)
  end

end
