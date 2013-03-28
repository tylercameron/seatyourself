class Restaurant < ActiveRecord::Base
  belongs_to :category
  has_many :reservations
  attr_accessible :address, :description, :name, :phone, :picture, :category, :capacity
end
