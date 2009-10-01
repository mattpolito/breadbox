class MarketingController < ApplicationController
  skip_filter :check_account_status
  
  layout 'marketing'
  
  def index
    
  end
end