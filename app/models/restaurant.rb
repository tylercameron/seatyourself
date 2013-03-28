class Restaurant < ActiveRecord::Base
  belongs_to :category
  attr_accessible :address, :description, :name, :phone, :picture, :category, :capacity
end
