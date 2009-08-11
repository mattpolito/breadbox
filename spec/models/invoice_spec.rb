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
  
  it { should belong_to :client }
  it { should have_many :invoice_lines }

  it "should create a new instance given valid attributes" do
    Invoice.create!(@valid_attributes)
  end
  
  it "should find last used invoice number" do
    2.times { Factory(:invoice) }
    invoice = Invoice.new(@valid_attributes)
    invoice.last_used_number.should == 2
  end
  
  it "should find last used invoice number if none have been created yet" do
    invoice = Factory.build(:invoice, :number => nil)
    invoice.last_used_number.should == 0
  end
  
  context "validations" do
    it "should require number" do
      Factory.build(:invoice, :number => nil).should_not be_valid
    end
  end
end
