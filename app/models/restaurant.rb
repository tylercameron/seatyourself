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
end
