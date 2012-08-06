class UsersController < ApplicationController


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
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
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
    
    flash[:success] = "Error Occured"
    flash[:success] = "Profile successfully updated." if @user_update
    redirect_to '/Profile'
    return
  end
  
end