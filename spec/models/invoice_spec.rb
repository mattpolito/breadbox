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
  
  it { should belong_to(:client) }
  it { should have_many(:invoice_lines) }
  it { should have_many(:payments) }
  
  context ".yearly_estimated_income" do
    it "should return total amount invoiced for current year" do
      invoice = Factory(:invoice)
      3.times { Factory(:invoice_line, :invoice => invoice) }
      invoice2 = Factory(:invoice)
      3.times { Factory(:invoice_line, :invoice => invoice2) }
      invoice3 = Factory(:invoice, :billing_date => Date.today - 400.days)
      3.times { Factory(:invoice_line, :invoice => invoice3) }
      Invoice.yearly_estimated_income.should == 150000      
    end
  end
  
  context "overdue named_scope" do
    it "should return all overdue invoices that have been 'sent'" do
      2.times { Factory(:invoice, :status => 'sent', :payment_due_date => Date.today - 5.days )}
      Factory(:invoice)
      Invoice.overdue.should have(2).invoices
    end
  end
  
  context "newly_created named_scope" do
    it "should return all invoices that have been created within the last week" do
      2.times { Factory(:invoice) }
      2.times { Factory(:invoice, :status => 'sent') }
      2.times { Factory(:invoice, :created_at => Date.today - 7.days) }
      Invoice.newly_created(5).should have(2).invoices
    end
  end
  
  context "order named_scope" do
    it "should add order to the find query" do
      invoice_1 = Factory(:invoice, :number => 10)
      invoice_2 = Factory(:invoice, :number => 5)
      invoice_3 = Factory(:invoice, :number => 15)
      Invoice.all.size.should == 3
      Invoice.all.second.should == invoice_2
      Invoice.order('number DESC').second.should == invoice_1
    end
  end
  
  context "pending named_scope" do
    it "should return all that have a status of 'draft' or 'sent'" do
      2.times { Factory(:invoice, :status => 'paid') }
      3.times { Factory(:invoice, :status => 'draft') }
      4.times { Factory(:invoice, :status => 'sent') }
      Invoice.pending.should have(7).invoices
    end
  end
  
  context "limit named_scope" do
    it "should add limit to the find query" do
      4.times { Factory(:invoice)}
      Invoice.all.should have(4).invoices
      Invoice.limit(2).should have(2).invoices
    end
  end

  it "should create a new instance given valid attributes" do
    Invoice.create!(@valid_attributes)
  end
  
  context "instance" do
    describe "last used number" do
      it "should be returned" do
        2.times { Factory(:invoice) }
        invoice = Invoice.new(Factory.attributes_for(:invoice))
        invoice.last_used_number.should == Invoice.last.number
      end

      it "should return _0_ if none have been created yet" do
        invoice = Factory.build(:invoice, :number => nil)
        invoice.last_used_number.should == 0
      end
    end
    
    it "should return organization that owns client's invoice" do
      organization = Factory(:organization)
      client = Factory(:client, :organization => organization)
      invoice = Factory(:invoice, :client => client)
      invoice.organization.should == organization
    end

    it "should return total amount" do
      invoice = Factory(:invoice)
      3.times { Factory(:invoice_line, :invoice => invoice) }
      invoice.total_amount.should == 75000
    end

    it "should return amount due" do
      invoice = Factory(:invoice)
      3.times { Factory(:invoice_line, :invoice => invoice) }
      3.times { invoice.payments.create! :amount => "100" }
      invoice.total_amount.should == 75000
      invoice.amount_due.should == 45000
    end  

    it "should return true if overdue" do
      invoice = Factory(:invoice, :payment_due_date => Date.today - 1.day, :status => 'sent')
      invoice.should be_sent
      invoice.should be_overdue
    end

    describe "views" do
      it "should return 'is' or 'was' if payment is in the future or past" do
        payment_due_in_past = Factory(:invoice, :payment_due_date => Date.today - 1.day, :status => 'sent')
        payment_due_in_past.is_or_was.should == 'was'
        payment_due_in_future = Factory(:invoice, :payment_due_date => Date.today + 1.day, :status => 'sent')
        payment_due_in_future.is_or_was.should == 'is'
      end
    end

    describe "aasm" do
      it "should set status to 'draft' when created" do
        invoice = Factory(:invoice)
        invoice.status == 'draft'
      end
    end

    describe "validations" do
      it "should require number" do
        Factory.build(:invoice, :number => nil).should_not be_valid
      end

      it "should be valid with a unique number" do
        Factory(:invoice, :number => 1)
        Factory.build(:invoice, :number => 2).should be_valid
      end

      it "should not be valid if number is not unique" do
        Factory(:invoice, :number => 1)
        Factory.build(:invoice, :number => 1).should_not be_valid
      end
    end
  end
end
