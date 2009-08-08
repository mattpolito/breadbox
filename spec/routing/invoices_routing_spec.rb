require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InvoicesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "invoices", :action => "index").should == "/invoices"
    end

    it "maps #new" do
      route_for(:controller => "invoices", :action => "new").should == "/invoices/new"
    end

    it "maps #show" do
      route_for(:controller => "invoices", :action => "show", :id => "1").should == "/invoices/1"
    end

    it "maps #edit" do
      route_for(:controller => "invoices", :action => "edit", :id => "1").should == "/invoices/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "invoices", :action => "create").should == {:path => "/invoices", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "invoices", :action => "update", :id => "1").should == {:path =>"/invoices/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "invoices", :action => "destroy", :id => "1").should == {:path =>"/invoices/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/invoices").should == {:controller => "invoices", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/invoices/new").should == {:controller => "invoices", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/invoices").should == {:controller => "invoices", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/invoices/1").should == {:controller => "invoices", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/invoices/1/edit").should == {:controller => "invoices", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/invoices/1").should == {:controller => "invoices", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/invoices/1").should == {:controller => "invoices", :action => "destroy", :id => "1"}
    end
  end
end
