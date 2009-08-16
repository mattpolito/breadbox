require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clients/index.html.haml" do
  include ClientsHelper

  before(:each) do
    assigns[:clients] = [
      stub_model(Client,
        :name => "value for name",
        :email => "value for email",
        :address => "value for address",
        :phone => "value for phone",
        :fax => "value for fax"
      ),
      stub_model(Client,
        :name => "value for name",
        :email => "value for email",
        :address => "value for address",
        :phone => "value for phone",
        :fax => "value for fax"
      )
    ]
  end

  # it "renders a list of clients" do
  #   render
  #   response.should have_tag("tr>td", "value for name".to_s, 2)
  #   response.should have_tag("tr>td", "value for email".to_s, 2)
  #   response.should have_tag("tr>td", "value for address".to_s, 2)
  #   response.should have_tag("tr>td", "value for phone".to_s, 2)
  #   response.should have_tag("tr>td", "value for fax".to_s, 2)
  # end
end
