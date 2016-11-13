class User < ApplicationRecord
<<<<<<< HEAD

=======
>>>>>>> fdded1be03700cbd13a97d5d99ac68e41217adb8
  has_secure_password

  validates :name, presence: true

	has_many :reservations
	has_many :restaurants, through: :reservations
end
