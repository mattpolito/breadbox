require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include Authlogic::TestCase

describe UserSession do
  before(:each) do
    # Authlogic::Session::Base.controller = stub('controller')
  end
  
  describe "welcome message" do
    it "should welcome new user" do
      user = Factory(:user)
      user_session = UserSession.new(:email => user.email, :password => user.password)
      p user_session
      
    end
  end
end