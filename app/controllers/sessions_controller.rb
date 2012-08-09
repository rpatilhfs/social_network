class SessionsController < ApplicationController
  
  def create
    auth_hash = request.env['omniauth.auth']
    auth = Authorization.find_or_create(auth_hash)
    session[:current_user_id] = auth
    session[:current_user] = User.find(auth)
    flash[:notice] = "Login successful!"
    redirect_to '/Dashboard'
    return
  end
  
  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

end
