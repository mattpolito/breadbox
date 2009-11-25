class MarketingController < ApplicationController
  skip_filter :check_for_valid_account
  layout "marketing"
  def index

  end
  
  def thank_you
    
  end
end