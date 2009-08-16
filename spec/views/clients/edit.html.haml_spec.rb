require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clients/edit.html.haml" do
  include ClientsHelper

  before(:each) do
    assigns[:client] = @client = stub_model(Client,
      :new_record? => false,
      :name => "value for name",
      :email => "value for email",
      :address => "value for address",
      :phone => "value for phone",
      :fax => "value for fax"
    )
  end

  it "renders the edit client form" do
    render

    response.should have_tag("form[action=#{client_path(@client)}][method=post]") do
      with_tag('input#client_name[name=?]', "client[name]")
      with_tag('input#client_email[name=?]', "client[email]")
      with_tag('textarea#client_address[name=?]', "client[address]")
      with_tag('input#client_phone[name=?]', "client[phone]")
      with_tag('input#client_fax[name=?]', "client[fax]")
    end
  end
end
