class Restaurant < ApplicationRecord


  # validates :name, :description, :cuisine, :price, :street_address, :neighbourhood, :phone, :image, presence: true
  # validates :phone, numericality: {only_integer: true}

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
    where("description ILIKE ?", "%#{search}%")
    where("cuisine ILIKE ?", "%#{search}%")
    where("price ILIKE ?", "%#{search}%")
    where("street_address ILIKE ?", "%#{search}%")
    where("neighbourhood ILIKE ?", "%#{search}%")
  end

  has_many :reservations
  has_many :users, through: :reservations
end
