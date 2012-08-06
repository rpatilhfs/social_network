class DashboardsController < ApplicationController
  
  def index
    @user = gerCurrentUser
  end
  
  def profile
    @user = User.find(session[:current_user].id)
  end
  
end
