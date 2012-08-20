class DashboardsController < ApplicationController
  
  layout 'application'
  
  before_filter :require_login
  
  def index
    @user = User.find(session[:current_user_id])
  end
  
  def profile
    @user = User.find(session[:current_user_id])
  end
  
  def show_all_users
    debugger
    params[:page] = 10
    @user = User.find(session[:current_user_id])
    @show_all_users = User.paginate(page: params[:page])
  end
  
end
