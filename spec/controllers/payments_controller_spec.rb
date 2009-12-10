require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PaymentsController do
  
  before(:each) do
    activate_authlogic
    @request.host = "reactioncontrol.test.host"
    @account = Factory(:account, :subdomain => 'reactioncontrol')
    @organization = Factory(:organization, :account => @account)
    @client = Factory(:client, :organization => @organization)
    @invoice = Factory(:invoice, :client => @client)
    @user = Factory(:user, :organization => @organization)
    UserSession.create(@user)
    controller.stub!(:current_account).and_return(mock_model(Account))
    controller.stub!(:current_organization).and_return(mock_model(Organization))
    
  end

  describe "GET new" do
    it "assigns a new payment to @payment" do
      # Invoice.stub!(:find).with("#{@invoice.id}").and_return(@invoice)
      mock_invoice = stub_model(Invoice)
      mock_payment = mock_model(Payment, :invoice => mock_invoice)
      Invoice.stub!(:find).with("37").and_return(mock_invoice)
      get :new
      assigns[:payment].should == payment
    end
  end

end
