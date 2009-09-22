require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Account do
  before(:each) do
    @valid_attributes = {
      :subdomain => "value for subdomain"
    }
  end

  it "should create a new instance given valid attributes" do
    Account.create!(@valid_attributes)
  end
  
  describe "subdomain" do
    it "should be stored as lowercase"
  end
  
  describe "validations" do
    it "should have a subdomain"
    
    it "should ensure subdomain is unique"
    
    it "should ensure subdomain is alpha-numeric with no characters or spaces with the exception of dash"
  end
end
