class DashboardsController < ApplicationController
  
  layout 'application'
  
  before_filter :require_login
  
  def index
    @user = User.find(gerCurrentUserID)
  end
  
  def profile
    @user = User.find(gerCurrentUserID)
  end
  
end
