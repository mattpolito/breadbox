require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Client do
  
  # it { should have_many(:invoices) }
  # it { should have_one(:address) }
  # it { should belong_to(:organization) }

  context "invoices" do
    it "should return total amount due for all open invoices" do
      client = Fabricate(:client)
      3.times { invoice = Fabricate(:invoice, :client => client)
      3.times { Fabricate(:invoice_line, :invoice => invoice) }
      3.times { invoice.payments.create! :amount => "100" } }
      3.times { invoice = Fabricate(:invoice, :client => client, :status => 'paid')
      3.times { Fabricate(:invoice_line, :invoice => invoice) }
      3.times { invoice.payments.create! :amount => "100" } }
      client.amount_due.should == 135000
    end
  end
  
  describe "name" do
    it "should return full name" do
      client = Fabricate.build(:client, first_name: 'First', last_name: 'Last')
      client.name.should == "First Last"
    end
  end
  
  context "validations" do
    # it "should require name" do
    #   client = Fabricate.build(:client, :name => nil)
    #   client.should_not be_valid
    # end
    
    it "should require an email address" do
      client = Fabricate.build(:client, :email => nil)
      client.should_not be_valid
    end
  end
end
