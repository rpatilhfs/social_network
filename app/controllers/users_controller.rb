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
end