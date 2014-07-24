class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  has_many :reservations

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end
