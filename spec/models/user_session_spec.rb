require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSession do
  before(:each) do
    # Authlogic::Session::Base.controller = stub('controller')
  end
  
  describe "welcome message" do
    xit "should welcome new user" do
      user = Factory(:user)
      user_session = UserSession.new(:email => user.email, :password => user.password)
    end
  end
end
