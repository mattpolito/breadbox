require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Client do
  
  it { should have_many :invoices }
  it { should have_one :address }

  it "should create a new instance given valid attributes" do
    Client.create!(Factory.attributes_for(:client))
  end
  
  context "invoices" do
    it "should return total amount due for all open invoices" do
      client = Factory(:client)
      3.times { invoice = Factory(:invoice, :client => client)
                3.times { Factory(:invoice_line, :invoice => invoice) }
                3.times { invoice.payments.create! :amount => "100" } }
      client.amount_due.should == 135000
      # invoice.total_amount.should == 75000
      # invoice.amount_due.should == 45000
      
    end
  end
  
  describe "name" do
    it "should return full name" do
      client = Factory(:client)
      client.name.should == "First Last"
    end
  end
  
  context "validations" do
    # it "should require name" do
    #   client = Factory.build(:client, :name => nil)
    #   client.should_not be_valid
    # end
    
    it "should require an email address" do
      client = Factory.build(:client, :email => nil)
      client.should_not be_valid
    end
  end
end
