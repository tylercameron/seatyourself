class Restaurant < ApplicationRecord

  # validates :name, :description, :cuisine, :price, :street_address, :neighbourhood, :phone, :image, presence: true
  # validates :phone, numericality: {only_integer: true}

  def self.search(search)
    # Restaurant.fuzzy_search(search)
    where("cuisine ILIKE ?", "%#{search}%")
     .or(where("description ILIKE ?", "%#{search}%"))
     .or(where("cuisine ILIKE ?", "%#{search}%"))
     .or(where("price ILIKE ?", "%#{search}%"))
     .or(where("street_address ILIKE ?", "%#{search}%"))
     .or(where("neighbourhood ILIKE ?", "%#{search}%"))
  end

  has_many :reservations
  has_many :users, through: :reservations


  def available (party_size, time)
    party_size > 0 && available_capacity(time) >= party_size
  end

  private
  def available_capacity(time)
    capacity - reservation_at(time).sum(:number_of_seats)
  end

  def reservation_at(time)
    reservations.where(time_of_reservation: time.beginning_of_hour..time.end_of_hour)
  end

end
