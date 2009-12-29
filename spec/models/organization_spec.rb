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
    describe "#next_invoice_number" do
      before(:each) do
        @organization = Factory(:organization)
        @client = Factory(:client, :organization => @organization)
      end
      
      it "should be returned" do
        2.times { Factory(:invoice, :client => @client) }
        @organization.next_invoice_number.should == @organization.invoices.last.number + 1
      end

      it "should return _1_ if none have been created yet" do
        Factory.build(:invoice, :number => nil, :client => @client)
        @organization.next_invoice_number.should == 1
      end
    end  
  end
  
end
