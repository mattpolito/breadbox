require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PaymentsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "payments", :action => "index").should == "/payments"
    end

    it "maps #new" do
      route_for(:controller => "payments", :action => "new").should == "/payments/new"
    end

    it "maps #show" do
      route_for(:controller => "payments", :action => "show", :id => "1").should == "/payments/1"
    end

    it "maps #edit" do
      route_for(:controller => "payments", :action => "edit", :id => "1").should == "/payments/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "payments", :action => "create").should == {:path => "/payments", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "payments", :action => "update", :id => "1").should == {:path =>"/payments/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "payments", :action => "destroy", :id => "1").should == {:path =>"/payments/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/payments").should == {:controller => "payments", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/payments/new").should == {:controller => "payments", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/payments").should == {:controller => "payments", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/payments/1").should == {:controller => "payments", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/payments/1/edit").should == {:controller => "payments", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/payments/1").should == {:controller => "payments", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/payments/1").should == {:controller => "payments", :action => "destroy", :id => "1"}
    end
  end
end
