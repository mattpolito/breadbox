require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InvoiceLine do
  before(:each) do
    @valid_attributes = {
      :description => "value for description",
      :quantity => 1,
      :price => 1
    }
  end
  
  # it { should belong_to :invoice }

  describe "#price" do
    before(:each) do
      @invoice_line = Fabricate(:invoice_line, :quantity => '5', :price => '50.50')
    end
    
    it "should save #price as price_in_cents" do
      @invoice_line.price_in_cents.should == 5050
    end

    it "should return dollars when #price is called" do
      @invoice_line.price.should == 50.5
    end
  end
  
  it "should find total price for line" do
    invoice_line = Fabricate(:invoice_line, :quantity => '5', :price => '50.50')
    invoice_line.total_amount.should == 25250
  end
  
  describe "validations" do
    it "should require quantity to be valid" do
      invoice_line = Fabricate.build(:invoice_line)
      invoice_line.should be_valid
    end
    
    it "should be invalid without quantity" do
      invoice_line = Fabricate.build(:invoice_line, :quantity => nil)
      invoice_line.should_not be_valid
    end
    
    it "should require price to be valid" do
      invoice_line = Fabricate.build(:invoice_line)
      invoice_line.should be_valid
    end
    
    it "should be invalid without price" do
      invoice_line = Fabricate.build(:invoice_line, :quantity => nil)
      invoice_line.should_not be_valid
    end
  end
end
