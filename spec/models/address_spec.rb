require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Address do

  # it { should belong_to :addressable }

  context "validations" do
    it "should require street1" do
      address = Fabricate.build(:address, :street1 => nil)
      address.should_not be_valid
    end
    
    it "should be valid with street1" do
      address = Fabricate.build(:address, :street1 => 'street1')
      address.should be_valid
    end
    
    it "should require city" do
      address = Fabricate.build(:address, :city => nil)
      address.should_not be_valid
    end
    
    it "should be valid with city" do
      address = Fabricate.build(:address, :city => 'city')
      address.should be_valid
    end
    
    it "should require state" do
      address = Fabricate.build(:address, :state => nil)
      address.should_not be_valid
    end
    
    it "should be valid with state" do
      address = Fabricate.build(:address, :state => 'state')
      address.should be_valid
    end
    
    it "should require zipcode" do
      address = Fabricate.build(:address, :zipcode => nil)
      address.should_not be_valid
    end
    
    it "should be valid with zipcode" do
      address = Fabricate.build(:address, :zipcode => 'state')
      address.should be_valid
    end
  end
  
  
end
