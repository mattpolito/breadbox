require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Organization do
  # it { should have_db_column(:name).of_type(:string) }
  # it { should have_db_column(:phone).of_type(:string) }
  # it { should have_db_column(:fax).of_type(:string) }
  # it { should have_db_column(:email).of_type(:string) }
  
  # it { should belong_to(:account) }
  # it { should have_many(:clients) }
  # it { should have_many(:invoices) }
  # it { should have_many(:users) }
  # it { should have_one(:address) }
  
  describe "instance" do    
    before(:each) do
      @organization = Fabricate(:organization)
      @client = Fabricate(:client, :organization => @organization)
    end
    
    describe "normalized attributes" do
      subject { Fabricate.build(:organization) }

      it "strips phone number of uneccesary characters" do
        subject.phone = '(900) 868-1029'
        subject.valid?
        subject.phone.should == '9008681029'
      end
      
      it "normalizes phone number with country code and extension" do
        subject.phone = '1-900-868-1029 x549'
        subject.valid?
        subject.phone.should == '9008681029549'
      end

      it "returns nil if not populated" do
        subject.phone = ''
        subject.valid?
        subject.phone.should == nil
      end
      
      it "should strip email of extra whitespace" do
        subject.email = ' something@somewhere.com '
        subject.valid?
        subject.email.should == 'something@somewhere.com'
      end
      
      it "should strip name of extra whitespace" do
        subject.name = ' My Name   '
        subject.valid?
        subject.name.should == 'My Name'
      end
    end
    
    describe ".next_invoice_number" do      
      it "should be returned" do
        2.times { Fabricate(:invoice, :client => @client) }
        @organization.next_invoice_number.should == @organization.invoices.last.number + 1
      end

      it "should return _1_ if none have been created yet" do
        Fabricate.build(:invoice, :number => nil, :client => @client)
        @organization.next_invoice_number.should == 1
      end
    end
    
    describe ".yearly_estimated_income" do
      it "should return total amount invoiced for current year" do
        invoice = Fabricate(:invoice, :client => @client)
        3.times { Fabricate(:invoice_line, :invoice => invoice) }
        invoice2 = Fabricate(:invoice, :client => @client)
        3.times { Fabricate(:invoice_line, :invoice => invoice2) }
        invoice3 = Fabricate(:invoice, :client => @client, :billing_date => Date.today - 400.days)
        3.times { Fabricate(:invoice_line, :invoice => invoice3) }
        @organization.yearly_estimated_income.should == 150000      
      end
    end
  end
  
end
