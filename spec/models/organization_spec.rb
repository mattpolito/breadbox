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
end
