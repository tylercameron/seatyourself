class User < ApplicationRecord

	has_secure_password
	validates :name, :email, :phone, :password, :password_confirmation, presence: true


	has_many :reservations
	has_many :restaurants, through: :reservations
end
