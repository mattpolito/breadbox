require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Organization do 
  it { should belong_to(:account) }
  it { should have_many(:clients) }
  it { should have_many(:invoices) }
  it { should have_many(:users) }
  it { should have_one(:address) }

  it "should create a new instance given valid attributes" do
    Organization.create!(Factory.attributes_for(:organization))
  end
  
  describe "instance" do    
    before(:each) do
      @organization = Factory(:organization)
      @client = Factory(:client, :organization => @organization)
    end
    
    describe ".next_invoice_number" do      
      it "should be returned" do
        2.times { Factory(:invoice, :client => @client) }
        @organization.next_invoice_number.should == @organization.invoices.last.number + 1
      end

      it "should return _1_ if none have been created yet" do
        Factory.build(:invoice, :number => nil, :client => @client)
        @organization.next_invoice_number.should == 1
      end
    end
    
    describe ".yearly_estimated_income" do
      it "should return total amount invoiced for current year" do
        invoice = Factory(:invoice, :client => @client)
        3.times { Factory(:invoice_line, :invoice => invoice) }
        invoice2 = Factory(:invoice, :client => @client)
        3.times { Factory(:invoice_line, :invoice => invoice2) }
        invoice3 = Factory(:invoice, :client => @client, :billing_date => Date.today - 400.days)
        3.times { Factory(:invoice_line, :invoice => invoice3) }
        @organization.yearly_estimated_income.should == 150000      
      end
    end
  end
  
end
