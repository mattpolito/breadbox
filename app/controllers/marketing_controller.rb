class MarketingController < ApplicationController
  skip_filter :check_for_valid_account
  
  def index
    
  end
end