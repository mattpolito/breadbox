require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Invoice do
  before(:each) do
    @valid_attributes = {
      :number => 1,
      :payment_due_date => Date.today,
      :note => "value for note",
      :billing_date => Date.today
    }
  end
  
  it { should belong_to(:client) }
  it { should have_many(:invoice_lines) }

  it "should create a new instance given valid attributes" do
    Invoice.create!(@valid_attributes)
  end
  
  it "should find last used invoice number" do
    2.times { Factory(:invoice) }
    invoice = Invoice.new(Factory.attributes_for(:invoice))
    invoice.last_used_number.should == 3
  end
  
  it "should find last used invoice number if none have been created yet" do
    invoice = Factory.build(:invoice, :number => nil)
    invoice.last_used_number.should == 0
  end
  
  it "should return total amount" do
    invoice = Factory(:invoice)
    3.times { Factory(:invoice_line, :invoice => invoice) }
    invoice.total_amount.should == 75000
  end
  
  context "aasm" do
    it "should set status to 'draft' when created" do
      invoice = Factory(:invoice)
      invoice.status == 'draft'
    end
  end
  
  context "validations" do
    it "should require number" do
      Factory.build(:invoice, :number => nil).should_not be_valid
    end
    
    it "should be valid with a unique number" do
      Factory(:invoice, :number => 1)
      Factory.build(:invoice, :number => 2).should be_valid
    end
    
    it "should not be valid if number is not unique" do
      Factory(:invoice, :number => 1)
      Factory.build(:invoice, :number => 1).should_not be_valid
    end
  end
end
