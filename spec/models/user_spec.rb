require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  let(:valid_attributes) { Fabricate.attributes_for(:user) }
  
  # it { should belong_to(:organization) }

  describe "name" do
    it "should display a combination of first and last name" do
      user = User.new(valid_attributes)
      user.name.should == "First Last"
    end
  end
  
  context "validations" do
    it "should require first_name" do
      user = Fabricate.build(:user, :first_name => nil)
      user.should_not be_valid
    end
    
    it "should be valid with first_name" do
      user = Fabricate.build(:user)
      user.should be_valid
    end
    
    it "should require last_name" do
      user = Fabricate.build(:user, :last_name => nil)
      user.should_not be_valid
    end
    
    it "should be valid with last_name" do
      user = Fabricate.build(:user)
      user.should be_valid
    end
    
    it "should require email" do
      user = Fabricate.build(:user, :email => nil)
      user.should_not be_valid
    end
    
    it "should be valid with email" do
      user = Fabricate.build(:user)
      user.should be_valid
    end
  end
end
