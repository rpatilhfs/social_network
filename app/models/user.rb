class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  
  acts_as_authentic
  
  #has_secure_password

  #before_save { |user| user.email = email.downcase }
  
end
