class Restaurant < ApplicationRecord

#  validates :name, :description, :cuisine, :price, :street_address, :neighbourhood, :phone, presence: true
#  validates :phone, numericality: {only_integer: true}

  has_many :reservations
  has_many :users, through: :reservations
end
