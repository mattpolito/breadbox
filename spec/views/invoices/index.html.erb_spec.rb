require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/invoices/index.html.erb" do
  include InvoicesHelper

  before(:each) do
    assigns[:invoices] = [
      stub_model(Invoice,
        :number => 1,
        :note => "value for note"
      ),
      stub_model(Invoice,
        :number => 1,
        :note => "value for note"
      )
    ]
  end

  # it "renders a list of invoices" do
  #   render
  #   response.should have_tag("tr>td", 1.to_s, 2)
  #   response.should have_tag("tr>td", "value for note".to_s, 2)
  # end
end
