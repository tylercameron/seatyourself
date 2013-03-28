class User < ActiveRecord::Base
  has_secure_password
  has_many :reservations

  attr_accessible :name, :email, :password, :password_confirmation
  validates :name, :email, :presence => true
  validates :email, :uniqueness => true  
  # We will need to limit this to :on => [:create] once we have a 
  # edit user page.
  validates :password_confirmation, :presence => true 


end
