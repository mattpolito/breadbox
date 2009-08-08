require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InvoicesController do

  def mock_invoice(stubs={})
    @mock_invoice ||= mock_model(Invoice, stubs)
  end
  
  def mock_clients(stubs={})
    @mock_client ||= 3.times { mock_model(Client, stubs) }
  end

  describe "GET index" do
    it "assigns all invoices as @invoices" do
      Invoice.stub!(:find).with(:all).and_return([mock_invoice])
      get :index
      assigns[:invoices].should == [mock_invoice]
    end
  end

  describe "GET show" do
    it "assigns the requested invoice as @invoice" do
      Invoice.stub!(:find).with("37").and_return(mock_invoice)
      get :show, :id => "37"
      assigns[:invoice].should equal(mock_invoice)
    end
  end

  describe "GET new" do
    it "assigns a new invoice as @invoice" do
      Invoice.stub!(:new).and_return(mock_invoice)
      get :new
      assigns[:invoice].should equal(mock_invoice)
    end
    
    it "assigns a collection of clients to @clients" do
      Client.stub!(:all).and_return([mock_clients])
      get :new
      assigns[:clients].should == [mock_clients]
    end
  end

  describe "GET edit" do
    it "assigns the requested invoice as @invoice" do
      Invoice.stub!(:find).with("37").and_return(mock_invoice)
      get :edit, :id => "37"
      assigns[:invoice].should equal(mock_invoice)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created invoice as @invoice" do
        Invoice.stub!(:new).with({'these' => 'params'}).and_return(mock_invoice(:save => true))
        post :create, :invoice => {:these => 'params'}
        assigns[:invoice].should equal(mock_invoice)
      end

      it "redirects to the created invoice" do
        Invoice.stub!(:new).and_return(mock_invoice(:save => true))
        post :create, :invoice => {}
        response.should redirect_to(invoice_url(mock_invoice))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved invoice as @invoice" do
        Invoice.stub!(:new).with({'these' => 'params'}).and_return(mock_invoice(:save => false))
        post :create, :invoice => {:these => 'params'}
        assigns[:invoice].should equal(mock_invoice)
      end

      it "re-renders the 'new' template" do
        Invoice.stub!(:new).and_return(mock_invoice(:save => false))
        post :create, :invoice => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested invoice" do
        Invoice.should_receive(:find).with("37").and_return(mock_invoice)
        mock_invoice.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :invoice => {:these => 'params'}
      end

      it "assigns the requested invoice as @invoice" do
        Invoice.stub!(:find).and_return(mock_invoice(:update_attributes => true))
        put :update, :id => "1"
        assigns[:invoice].should equal(mock_invoice)
      end

      it "redirects to the invoice" do
        Invoice.stub!(:find).and_return(mock_invoice(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(invoice_url(mock_invoice))
      end
    end

    describe "with invalid params" do
      it "updates the requested invoice" do
        Invoice.should_receive(:find).with("37").and_return(mock_invoice)
        mock_invoice.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :invoice => {:these => 'params'}
      end

      it "assigns the invoice as @invoice" do
        Invoice.stub!(:find).and_return(mock_invoice(:update_attributes => false))
        put :update, :id => "1"
        assigns[:invoice].should equal(mock_invoice)
      end

      it "re-renders the 'edit' template" do
        Invoice.stub!(:find).and_return(mock_invoice(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested invoice" do
      Invoice.should_receive(:find).with("37").and_return(mock_invoice)
      mock_invoice.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the invoices list" do
      Invoice.stub!(:find).and_return(mock_invoice(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(invoices_url)
    end
  end

end
