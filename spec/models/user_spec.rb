require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include Authlogic::TestCase

describe User do
  before(:each) do
    @valid_attributes = Factory.attributes_for(:user)
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
  
  describe "name" do
    it "should display a combination of first and last name" do
      user = Factory(:user)
      user.name.should == "First Last"
    end
  end
  
  context "validations" do
    it "should require first_name" do
      user = Factory.build(:user, :first_name => nil)
      user.should_not be_valid
    end
    
    it "should be valid with first_name" do
      user = Factory.build(:user)
      user.should be_valid
    end
    
    it "should require last_name" do
      user = Factory.build(:user, :last_name => nil)
      user.should_not be_valid
    end
    
    it "should be valid with last_name" do
      user = Factory.build(:user)
      user.should be_valid
    end
    
    it "should require email" do
      user = Factory.build(:user, :email => nil)
      user.should_not be_valid
    end
    
    it "should be valid with email" do
      user = Factory.build(:user)
      user.should be_valid
    end
  end
end
