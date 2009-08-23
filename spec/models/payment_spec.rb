require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Payment do
  before(:each) do

  end
  
  it { should belong_to :invoice}

  it "should create a new instance given valid attributes" do
    Payment.create!(Factory.attributes_for(:payment))
  end
  
  describe "invoice" do
    it "should get marked paid if amount_due is 0" do
      invoice = Factory(:invoice)
      3.times { Factory(:invoice_line, :invoice => invoice, :price => "50") }
      3.times { invoice.payments.create! :amount => "250" }
      invoice.reload
      invoice.should be_paid
    end
  end

  describe "amount" do
    it "should capture payment and convert to pennies before saving" do
      invoice = Factory(:invoice)
      payment = invoice.payments.create!(:amount => "10.00")
      payment.amount_in_cents.should == 1000
    end
    
    it "should display money value in a float" do
      invoice = Factory(:invoice)
      payment = invoice.payments.create!(:amount => "10.00")
      payment.amount.should == 10.0
    end    
  end
  
  describe "validations" do
    it "should require amount" do
      invoice = Factory(:invoice)
      payment = invoice.payments.build
      payment2 = invoice.payments.build :amount => "10.00"
      payment.should_not be_valid
      payment2.should be_valid
    end
  end

end
