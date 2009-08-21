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
end
