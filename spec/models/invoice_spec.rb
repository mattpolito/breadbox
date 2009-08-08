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

  it "should create a new instance given valid attributes" do
    Invoice.create!(@valid_attributes)
  end
  
  it "should find next available invoice number" do
    2.times { Factory(:invoice) }
    invoice = Invoice.new(@valid_attributes)
    invoice.next_available_number.should == 3
  end
  
  context "validations" do
    it "should require number" do
      Factory.build(:invoice, :number => nil).should_not be_valid
    end
  end
end
