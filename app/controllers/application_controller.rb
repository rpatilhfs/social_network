class ApplicationController < ActionController::Base
  
  protect_from_forgery
  #include SessionsHelper
  
  def gerCurrentUser
    return session[:current_user]
  end
  
  
end
