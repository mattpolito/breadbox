class UserSessionsController < ApplicationController
  skip_filter :check_if_login_required, :except => :destroy
  layout 'home'
  
  def new
    @user_session = current_organization.user_sessions.new
  end
  
  def create
    @user_session = current_organization.user_sessions.new(params[:user_session])
    if @user_session.save
      flash[:notice] = @user_session.welcome_message
      redirect_back_or_default dashboard_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default login_path
  end
end
