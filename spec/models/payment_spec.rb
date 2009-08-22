require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Payment do
  before(:each) do

  end
  
  it { should belong_to :invoice}

  it "should create a new instance given valid attributes" do
    Payment.create!(Factory.attributes_for(:payment))
  end
  
  it "should capture payment and convert to pennies before saving" do
    invoice = Factory(:invoice)
    payment = invoice.payments.create!(:amount => "10.00")
    payment.amount_in_cents.should == 1000
  end
end
