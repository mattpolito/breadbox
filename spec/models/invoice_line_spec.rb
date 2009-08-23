require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InvoiceLine do
  before(:each) do
    @valid_attributes = {
      :description => "value for description",
      :quantity => 1,
      :price => 1
    }
  end
  
  it { should belong_to :invoice }

  it "should create a new instance given valid attributes" do
    InvoiceLine.create!(@valid_attributes)
  end
  
  it "should find total price for line" do
    invoice_line = InvoiceLine.create :quantity => 5, :price => 50
    invoice_line.total_amount.should == 25000
  end
  
  describe "validations" do
    it "should require quantity to be valid" do
      invoice_line = Factory.build(:invoice_line)
      invoice_line.should be_valid
    end
    
    it "should be invalid without quantity" do
      invoice_line = Factory.build(:invoice_line, :quantity => nil)
      invoice_line.should_not be_valid
    end
    
    it "should require price to be valid" do
      invoice_line = Factory.build(:invoice_line)
      invoice_line.should be_valid
    end
    
    it "should be invalid without price" do
      invoice_line = Factory.build(:invoice_line, :quantity => nil)
      invoice_line.should_not be_valid
    end
  end
end
