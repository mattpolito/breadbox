# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include SubdomainAccounts
  
  # Callbacks
  # before_filter :check_account_status
  before_filter :check_if_login_required
  
  helper :all # include all helpers, all the time
  helper_method :logged_in?, :admin_logged_in?, :current_user_session, :current_user, :current_organization
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation

  def logged_in?
    !current_user_session.nil?
  end
  
  def admin_required
    unless current_user && current_user.admin?
      flash[:error] = "Sorry, you don't have access to that."
      redirect_to root_url and return false
    end
  end
  
  def admin_logged_in?
    logged_in? && current_user.admin?
  end

  private
    def banner_site?
      @banner_site ||= account_subdomain == default_account_subdomain
    end
  
    def check_account_status
      unless banner_site?
        redirect_to root_url
      end
    end
    
    def check_if_login_required
      require_user unless banner_site?
    end
    
    def current_organization
      @current_organization ||= current_account.organization
    end
    
    def current_layout_name
      banner_site? ? 'banner_site' : 'application'
    end
  
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    def require_user
      unless current_user
        store_location
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_url
        return false
      end
    end
  
    def store_location
      session[:return_to] = request.request_uri
    end
  
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
