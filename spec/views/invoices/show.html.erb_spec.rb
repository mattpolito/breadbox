require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/invoices/show.html.erb" do
  include InvoicesHelper
  before(:each) do
    assigns[:invoice] = @invoice = stub_model(Invoice,
      :number => 1,
      :note => "value for note"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ note/)
  end
end
