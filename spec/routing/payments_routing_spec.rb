require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PaymentsController do
  describe "route generation" do
    it "maps #new" do
      route_for(:controller => "payments", :action => "new", :invoice_id => "1").should == "invoices/1/payments/new"
    end

    it "maps #create" do
      route_for(:controller => "payments", :action => "create", :invoice_id => "1").should == {:path => "invoices/1/payments", :method => :post}
    end

    it "maps #destroy" do
      route_for(:controller => "payments", :action => "destroy", :id => "1", :invoice_id => "1").should == {:path =>"invoices/1/payments/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #new" do
      params_from(:get, "invoices/1/payments/new").should == {:controller => "payments", :action => "new", :invoice_id => "1"}
    end

    it "generates params for #create" do
      params_from(:post, "invoices/1/payments").should == {:controller => "payments", :action => "create", :invoice_id => "1"}
    end
    
    it "generates params for #destroy" do
      params_from(:delete, "invoices/1/payments/1").should == {:controller => "payments", :action => "destroy", :id => "1", :invoice_id => "1"}
    end
  end
end
