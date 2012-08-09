class DashboardsController < ApplicationController
  
  layout 'application'
  
  before_filter :require_login
  
  def index
    @user = User.find(session[:current_user_id])
  end
  
  def profile
    @user = User.find(session[:current_user_id])
  end
  
end
