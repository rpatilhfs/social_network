class ApplicationController < ActionController::Base
  
  protect_from_forgery
  #include SessionsHelper
  include OpenidSessionHelper
  
  # TwitterLogin
  helper_method :current_user
  

  def getCurrentUser
    return session[:current_user]
  end
  
  def getCurrentUserID
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

  # Generates a random string from a set of easily readable characters
  # => def generate_activation_code(size = 6)
  def generate_password
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z @ # $ & ! }
    (0...6).map{ charset.to_a[rand(charset.size)] }.join
  end


private

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
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
    !!getCurrentUser
  end  
  
end
