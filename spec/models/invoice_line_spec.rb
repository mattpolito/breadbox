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
end
