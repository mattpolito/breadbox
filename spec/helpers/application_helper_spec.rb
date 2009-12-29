require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationHelper do
  describe "#phone_number" do
    it "should return 10 digits only" do
      helper.phone_number("7732024876x4857").should == "7732024876"
    end
    
    it "should return nil if number is not available" do
      helper.phone_number(nil).should == nil
    end
  end
  
  describe "#phone_extension" do
    it "should return whatever is left of number past 10 digits" do
      helper.phone_extension("7732024876x4857").should == "x4857"
    end
    
    it "should return nil if number is not available" do
      helper.phone_extension(nil).should == nil
    end
  end
end