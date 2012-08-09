class UserSessionsController < ApplicationController

  before_filter :require_login, :only => :destroy
  #before_filter :require_login, :except=>[:new, :create]

  def new
    @user_session = UserSession.new
    request.env['omniauth.auth'] = nil
  end

  def create
    @user_session = UserSession.new(params[:users_sessions])
    if @user_session.save
      session[:current_user] = User.find_by_email(params[:users_sessions][:email])
      session[:user_id] = session[:current_user].id      
      flash[:notice] = "Login successful!"
      redirect_to '/Dashboard'
      return
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    reset_session
    flash[:notice] = "Logout successful!"
    redirect_to '/SignIn'
  end

end
