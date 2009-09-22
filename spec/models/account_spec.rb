require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Account do
  before(:each) do
  end

  it "should create a new instance given valid attributes" do
    Account.create!(Factory.attributes_for(:account))
  end
  
  describe "subdomain" do
    it "should be stored as lowercase" do
      account = Factory(:bad_account)
      account.subdomain.should == account.subdomain.downcase
    end
  end
  
  describe "validations" do
    before(:each) do
      @account = Factory.build(:account)
    end
    
    it "should have a subdomain" do
      @account.subdomain = nil
      @account.should_not be_valid
    end
    
    it "should ensure subdomain is unique" do
      @account.save!
      account = Factory.build(:account)
      account.subdomain = @account.subdomain
      account.should_not be_valid
    end
    
    it "should ensure subdomain is alpha-numeric with no characters or spaces with the exception of dash" do
      @account.subdomain = 'reaction-contro1 is cool'
      @account.should_not be_valid
      account = Factory.build(:account)
      account.subdomain = 'reaction-contro1'
      account.should be_valid
    end
    
    it "should ensure subdomain is lowercased" do
      account = Factory.build(:bad_account)
      account.should be_valid
      account1 = Factory.build(:account)
      account1.should be_valid
    end
    
    it "should ensure that reserved words cannot be taken by a subdomain" do
      %w( support blog www billing help api ).each do |reserved|
        @account.subdomain = "#{reserved}"
        @account.should_not be_valid
      end
    end
  end
end
