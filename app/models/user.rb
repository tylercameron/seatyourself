class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation
end
