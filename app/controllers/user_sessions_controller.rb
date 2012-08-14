class UserSessionsController < ApplicationController

  before_filter :require_login, :only => :destroy
  #before_filter :require_login, :except=>[:new, :create]

  def new
    #debugger
    @user_session = UserSession.new
    request.env['omniauth.auth'] = nil
  end

  def create
    #debugger
    
    # => {"users_sessions"=>{"email"=>"rpatil@mailinator.com", "password"=>"123456"}, "remember_me"=>"on", 
    # => "commit"=>"Sign in", "action"=>"create", "controller"=>"user_sessions"}
    
    @user_session = UserSession.new(params[:users_sessions])
    @user_session.save do |result|
      if result
        session[:current_user] = @user = User.find_by_email(params[:users_sessions][:email])
        session[:current_user_id] = @user.id
        flash[:notice] = "Login successful!"
        #debugger
        ## Remember Me
        set_remember_me(@user) if params[:remember_me].to_i == GlobalConstants::STATUS_TRUE
        #debugger
        
        redirect_to '/Dashboard'
        return
      else
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

  def destroy
    #debugger
    #cookies.delete(:social_network_session)
    #cookies.delete(:email)
    #cookies.delete(:remembrance_token)
    #cookies.delete(:expiry_time)

    reset_session
    flash[:notice] = "Logout successful!"
    #redirect_to '/SignIn'
    redirect_to '/SignOutCompletely'
  end
  
  def set_remember_me(user)
    cookies.permanent[:social_network_session] = "SocialNetwork"
    cookies.permanent[:email] = user.email
    cookies.permanent[:remembrance_token] = user.remember_token.reverse
    cookies.permanent[:expiry_time] = (Time.now + 1.hour).strftime("%Y-%m-%d %H:%M")
  end

  def signin_by_cookie
    #debugger
    if session[:current_user].nil?
      # => {"email"=>"rpatil@mailinator.com", 
      # => "token"=>"AD-74DGLPWxLXNNQrVNF8I", "session"=>"SocialNetwork"
      #debugger
      conditions = "email = '#{params[:email]}' AND remember_token = '#{params[:token].reverse}'"      
      @user = User.find(:first, :conditions => conditions )
      
      if @user.present?
        session[:current_user] = @user
        session[:current_user_id] = @user.id
      end
      flash[:notice] = "Login successful!"
      redirect_to '/Dashboard'
      return
      #debugger
    else
    #cookies.delete(:social_network_session)
    #cookies.delete(:email)
    #cookies.delete(:remembrance_token)
    #cookies.delete(:expiry_time)

    reset_session
    flash[:notice] = "EEEEEEEEEEEEEE"
    redirect_to '/SignIn'
    end
  end
  
  def remove_cookies
    cookies.delete(:social_network_session)
    cookies.delete(:email)
    cookies.delete(:remembrance_token)
    cookies.delete(:expiry_time)

    reset_session
    flash[:notice] = "Logout Successfully by removing cookies."
    redirect_to '/SignIn'
  end

end


=begin
   def create
    @user_session = UserSession.new(params[:users_sessions])
    if @user_session.save
      session[:current_user] = User.find_by_email(params[:users_sessions][:email])
      session[:current_user_id] = session[:current_user].id      
      flash[:notice] = "Login successful!"
      redirect_to '/Dashboard'
      return
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
 
=end