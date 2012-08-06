class DashboardsController < ApplicationController
  
  def index
    @user = gerCurrentUser
  end
  
end
