require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clients/show.html.erb" do
  include ClientsHelper
  before(:each) do
    assigns[:client] = @client = stub_model(Client,
      :name => "value for name",
      :email => "value for email",
      :address => "value for address",
      :phone => "value for phone",
      :fax => "value for fax"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ address/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/value\ for\ fax/)
  end
end
