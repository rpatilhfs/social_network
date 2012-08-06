class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  
  acts_as_authentic
  
  #has_secure_password

  #before_save { |user| user.email = email.downcase }
  
  before_save :create_remember_token
  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  
end
