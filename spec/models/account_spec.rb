require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Account do
  # it { should have_one(:organization) }
  # it { should have_many(:clients) }

  describe "instance" do
    it "should have many invoices" do
      account = Fabricate(:account)
      organization = account.create_organization
      3.times do
        client = Fabricate(:client, :organization => organization)
        2.times { Fabricate(:invoice, :client => client) }
      end
      account.should have(6).invoices
      
    end
  end
  
  describe "subdomain" do
    it "should be stored as lowercase" do
      account = Fabricate(:bad_account)
      account.subdomain.should == account.subdomain.downcase
    end
  end
  
  describe "validations" do
    before(:each) do
      @account = Fabricate.build(:account)
    end
    
    it "should have a subdomain" do
      @account.subdomain = nil
      @account.should_not be_valid
    end
    
    it "should ensure subdomain is unique" do
      @account.save!
      account = Fabricate.build(:account)
      account.subdomain = @account.subdomain
      account.should_not be_valid
    end
    
    it "should ensure subdomain is alpha-numeric with no characters or spaces with the exception of dash" do
      @account.subdomain = 'reaction-contro1 is cool'
      @account.should_not be_valid
      account = Fabricate.build(:account)
      account.subdomain = 'reaction-contro1'
      account.should be_valid
    end
    
    it "should ensure subdomain is lowercased" do
      account = Fabricate.build(:bad_account)
      account.should be_valid
      account1 = Fabricate.build(:account)
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
