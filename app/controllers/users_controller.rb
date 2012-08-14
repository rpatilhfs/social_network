class UsersController < ApplicationController

  before_filter :require_login, :except=>[:new, :create, :registration_success, :signout_completely]

  def new
    @user = User.new
  end

  def create
    name = params[:user][:name].upcase!
    email = params[:user][:email]
    password = params[:user][:password]
    password_confirmation = params[:user][:password_confirmation]
    
    @user = User.new
    @user.name = name
    @user.email = email
    @user.password = password
    @user.password_confirmation = password_confirmation
    
    if @user.save
      flash[:success] = "Registration done successfully. Please login again !!"      
      Mailer.account_confirmation(email, name, GlobalConstants::MAIL_ACCOUNT_CONFIRMATION).deliver
      Mailer.welcome_message(email, name, GlobalConstants::MAIL_WELCOME_MESSAGE).deliver
      #redirect_to @user
      #############################################################################################
      session[:temperory_user_id] = @user.id
      redirect_to '/RegistrationSuccess'
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(session[:current_user].id)
  end
  
  def update_profile
    password = params[:user][:password]
    confirm_password = params[:user][:password_confirmation]
    id = session[:current_user].id
    
    if password.nil? and confirm_password.nil?
      @user_update = User.update(id, :name => params[:user][:name], :email => params[:user][:email] )
    else
      @user_update = User.update(id, :name => params[:user][:name], :email => params[:user][:email], :password => password, :password_confirmation => password )
    end
    
    flash[:success] = "Error Occured."
    flash[:success] = "Profile successfully updated." if @user_update
    redirect_to '/Profile'
    return
  end
  
  def update_email_address
    @user = User.find(session[:current_user].id)
    @user.email = params[:email]
    @user.save
    #flash[:success] = "Email address successfully updated." if @user.save
    render :nothing => true
  end
  
  def registration_success
    #flash[:success] = "Registration done successfully. Please login again !!"      
    @user = User.find(session[:temperory_user_id])
  end
  
  def signout_completely
    
  end
  
  
end

=begin
  def create
    debugger
    name = params[:user][:name].upcase!
    email = params[:user][:email]
    password = params[:user][:password]
    password_confirmation = params[:user][:password_confirmation]
    @user = User.new(params[:user])
    @user.save do |result|
      #if result
        flash[:success] = "Welcome to the Sample App!"
        UserMailer.registration_confirmation(@user).deliver
        redirect_to @user
      else
        render :action => 'new'
      end
    end
  end
=end