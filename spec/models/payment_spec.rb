require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Payment do
  before(:each) do

  end
  
  it { should belong_to :invoice}

  it "should create a new instance given valid attributes" do
    Payment.create!(Factory.attributes_for(:payment))
  end
end
