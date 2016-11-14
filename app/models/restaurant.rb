class Restaurant < ApplicationRecord

<<<<<<< HEAD
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
=======
  # validates :name, :description, :cuisine, :price, :street_address, :neighbourhood, :phone, presence: true
  # validates :phone, numericality: {only_integer: true}
>>>>>>> dbdba2c3d3c107e5959ca1c37bc853492e3007b4

  has_many :reservations
  has_many :users, through: :reservations
end
