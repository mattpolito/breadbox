require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClientsController do
  before(:each) do
    activate_authlogic
    @request.host = "reactioncontrol.test.host"
    @mock_account = Factory(:account, :subdomain => 'reactioncontrol')
    @mock_organization = Factory(:organization, :account => @mock_account)
    @mock_client = Factory(:client, :organization => @mock_organization)
    @mock_invoice = Factory(:invoice, :client => @mock_client)
    @mock_user = Factory(:user, :organization => @mock_organization)
    UserSession.create(@mock_user)
  end
  
  # def mock_organization(stubs={})
  #   @mock_organization ||= mock_model(Organization, stubs)
  # end
  # 
  def mock_client(stubs={})
    @mock_client ||= mock_model(Client, stubs)
  end
  # 
  # def mock_address(stubs={})
  #   @mock_address ||= mock_model(Address, :client => mock_client)
  # end
  # 
  # def mock_invoice(stubs={})
  #   @mock_invoice ||= mock_model(Invoice, :client => mock_client)
  # end

  describe "GET index" do
    it "assigns all clients as @clients" do
      get :index
      assigns[:clients].should == [mock_client]
    end
  end

  describe "GET show" do
    it "assigns the requested client as @client" do
      Client.stub!(:find).with("37").and_return(mock_client)
      get :show, :id => "37"
      assigns[:client].should == mock_client
    end
    
    it "assigns the requested invoices as @invoices" do
      Client.stub!(:find).with("37").and_return(mock_client)
      get :show, :id => "37"
      assigns[:invoices].should == [mock_invoice]
    end
  end
  
  describe "GET new" do
    it "assigns a new client as @client" do
      Client.stub!(:new).and_return(mock_client)
      get :new
      assigns[:client].should == mock_client
    end
  end
  
  describe "GET edit" do
    it "assigns the requested client as @client" do
      Client.stub!(:find).with("37").and_return(mock_client)
      get :edit, :id => "37"
      assigns[:client].should equal(mock_client)
    end
    
    it "builds address when not present" do
      Client.stub!(:find).with("37").and_return(mock_client)
      p mock_client.address
      mock_client.should_receive(:build_address)
    end
    
    it "does not build address when present" do
      Client.stub!(:find).with("37").and_return(mock_client(:address => mock_model(Address)))
      p mock_client.address
      mock_client.should_not_receive(:build_address)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created client as @client" do
        Client.stub!(:new).with({'these' => 'params'}).and_return(mock_client(:save => true))
        post :create, :client => {:these => 'params'}
        assigns[:client].should equal(mock_client)
      end
    
      it "redirects to the created client" do
        Client.stub!(:new).and_return(mock_client(:save => true))
        post :create, :client => {}
        response.should redirect_to(client_url(mock_client))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved client as @client" do
        Client.stub!(:new).with({'these' => 'params'}).and_return(mock_client(:save => false))
        post :create, :client => {:these => 'params'}
        assigns[:client].should equal(mock_client)
      end
    
      xit "re-renders the 'new' template" do
        Client.stub!(:new).and_return(mock_client(:save => false))
        post :create, :client => {}
        response.should render_template('new')
      end
    end
  end
  
  describe "PUT update" do
    describe "with valid params" do
      xit "updates the requested client" do
        Client.should_receive(:find).with("37").and_return(mock_client)
        mock_client.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :client => {:these => 'params'}
      end
    
      it "assigns the requested client as @client" do
        Client.stub!(:find).and_return(mock_client(:update_attributes => true))
        put :update, :id => "37"
        assigns[:client].should equal(mock_client)
      end
    
      it "redirects to the client" do
        Client.stub!(:find).and_return(mock_client(:update_attributes => true))
        put :update, :id => "37"
        response.should redirect_to(client_url(mock_client))
      end
      
      it "should have flash message" do
        Client.stub!(:find).and_return(mock_client(:update_attributes => true))
        put :update, :id => "37"
        flash[:success].should == 'Client was successfully updated.'
      end
    end
    
    describe "with invalid params" do
      xit "updates the requested client" do
        Client.should_receive(:find).with("37").and_return(mock_client)
        mock_client.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :client => {:these => 'params'}
      end
    
      it "assigns the client as @client" do
        Client.stub!(:find).and_return(mock_client(:update_attributes => false))
        put :update, :id => "37"
        assigns[:client].should equal(mock_client)
      end
    
      xit "re-renders the 'edit' template" do
        Client.stub!(:find).and_return(mock_client(:update_attributes => false))
        put :update, :id => "37"
        p flash
        response.should render_template('edit')
      end
      
      xit "should have no flash message" do
        Client.stub!(:find).and_return(mock_client(:update_attributes => false))
        put :update, :id => "37"
        p flash
        flash.should be_empty
      end
    end
  end
  
  describe "DELETE destroy" do
    it "destroys the requested client" do
      Client.stub!(:find).and_return(mock_client(:destroy => true))
      delete :destroy, :id => "37"
    end
    
    it "redirects to the clients list" do
      Client.stub!(:find).and_return(mock_client(:destroy => true))
      delete :destroy, :id => "37"
      response.should redirect_to(clients_url)
    end
  end

end
