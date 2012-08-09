class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :first_name, :last_name, :gender, :profile_link, :image_link, :token
  
  belongs_to :user
  
  validates :provider, :uid, :presence => true
  
  def self.find_or_create(auth_hash)
    email = auth_hash["info"]["email"]
    @user_exist = User.find_by_email(email)
    
    if @user_exist.nil?
      password = generate_random_password
      @user_create = User.create :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"], :password => password, :password_confirmation => password
      @user = @user_create.id
    else
      @user = @user_exist.id
    end
    
    @user_exist_at_authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    if @user_exist_at_authorization.nil?
      @authorization_user = Authorization.create :provider => auth_hash["provider"], :uid => auth_hash["uid"], :user_id => @user,
                            :first_name => auth_hash["info"]["first_name"], :last_name => auth_hash["info"]["last_name"],
                            :gender => auth_hash["info"]["gender"], :profile_link => auth_hash["info"]["urls"]["Facebook"],
                            :image_link => auth_hash["info"]["image"], :token=> auth_hash["credentials"]["token"]
      @authorization_user_id = @authorization_user.user_id
    else
      @authorization_user_id = @user_exist_at_authorization.user_id
    end
    return @authorization_user_id
    #unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    #  user = User.create :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
    #  auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    #end
    
    #auth
  end
  
end
