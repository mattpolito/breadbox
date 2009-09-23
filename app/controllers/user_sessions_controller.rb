class UserSessionsController < ApplicationController
  skip_before_filter :check_account_status, :except => [:destroy]
  before_filter :require_no_user, :only => [:new, :create]
  layout 'home'
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = @user_session.welcome_message
      redirect_back_or_default root_url
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end
