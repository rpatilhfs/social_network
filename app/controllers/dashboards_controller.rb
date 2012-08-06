class DashboardsController < ApplicationController
  
  before_filter :require_login
  
  def index
    @user = gerCurrentUser
  end
  
  def profile
    @user = User.find(session[:current_user].id)
  end
  
end
