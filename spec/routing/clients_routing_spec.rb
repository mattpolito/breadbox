require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClientsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "clients", :action => "index").should == "/clients"
    end

    it "maps #new" do
      route_for(:controller => "clients", :action => "new").should == "/clients/new"
    end

    it "maps #show" do
      route_for(:controller => "clients", :action => "show", :id => "1").should == "/clients/1"
    end

    it "maps #edit" do
      route_for(:controller => "clients", :action => "edit", :id => "1").should == "/clients/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "clients", :action => "create").should == {:path => "/clients", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "clients", :action => "update", :id => "1").should == {:path =>"/clients/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "clients", :action => "destroy", :id => "1").should == {:path =>"/clients/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/clients").should == {:controller => "clients", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/clients/new").should == {:controller => "clients", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/clients").should == {:controller => "clients", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/clients/1").should == {:controller => "clients", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/clients/1/edit").should == {:controller => "clients", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/clients/1").should == {:controller => "clients", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/clients/1").should == {:controller => "clients", :action => "destroy", :id => "1"}
    end
  end
end
