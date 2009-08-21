require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

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
  
  describe "validations" do
    it "should require first_name" do
      user1 = Factory(:user)
      user2 = Factory(:user, :first_name => nil)
      p User.all
      # user1.should be_valid
      # user2.should_not be_valid
    end
    
    it "should require last_name" do
      user1 = Factory(:user)
      user2 = Factory(:user, :last_name => nil)
      user1.should be_valid
      user2.should_not be_valid
    end
    
    # it "should require email" do
    #   user1 = Factory(:user)
    #   user2 = Factory(:user, :email => nil)
    #   user1.should be_valid
    #   user2.should_not be_valid
    # end
  end
end
