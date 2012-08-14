class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  
  acts_as_authentic
  
  #has_secure_password
  #before_save { |user| user.email = email.downcase }
  
  before_save :create_remember_token  
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  ######################################################
  has_many :authorizations
  
  validates :name, :email, :presence => true
  
  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
  end

  ######################################################

  ######################################################
  # OPEN ID
=begin
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
  end
=end  
  ######################################################

  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
    
  #######################################################
  # OPEN ID
=begin  
  def map_openid_registration(registration)
    self.email = registration["email"] if email.blank?
    self.username = registration["nickname"] if username.blank?
  end
=end  
  #######################################################
  
end
