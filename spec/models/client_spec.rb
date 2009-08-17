require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Client do
  
  it { should have_many :invoices }
  it { should have_one :address }

  it "should create a new instance given valid attributes" do
    Client.create!(Factory.attributes_for(:client))
  end
  
  context "invoices" do
    it "should return total amount due for all open invoices"
    
    it "should return total number of pending invoices"
  end
  
  context "validations" do
    it "should require name" do
      client = Factory.build(:client, :name => nil)
      client.should_not be_valid
    end
    
    it "should require an email address" do
      client = Factory.build(:client, :email => nil)
      client.should_not be_valid
    end
  end
end
