class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation
  validates :name, :email, :presence => true
  
  # We will need to limit this to :on => [:create] once we have a 
  # edit user page.
  validates :password_confirmation, :presence => true 
end
