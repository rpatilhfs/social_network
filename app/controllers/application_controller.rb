class ApplicationController < ActionController::Base
  
  protect_from_forgery
  #include SessionsHelper
  
  # TwitterLogin
  helper_method :current_user
  

  def gerCurrentUser
    return session[:current_user]
  end
  
  def gerCurrentUserID
    return session[:current_user_id]
  end
  
  def login_required
    if session[:current_user_id].present?
      #redirect_to '/Dashboard'
    else
      reset_session
      flash[:success] = "Please log in !"
      redirect_to '/Index'
    end
  end

  def generate_random_password
    collection_element = [('a'..'z'),('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten
    return (0..7).map{ collection_element[rand(collection_element.length)] }.join
  end


private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/SignIn' # halts request cycle
    end
  end
 
  # The logged_in? method simply returns true if the user is logged
  # in and false otherwise. It does this by "booleanizing" the
  # current_user method we created previously using a double ! operator.
  # Note that this is not common in Ruby and is discouraged unless you
  # really mean to convert something into true or false.
  def logged_in?
    !!gerCurrentUser
  end  
  
end
