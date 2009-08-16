require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/invoices/new.html.haml" do
  include InvoicesHelper

  before(:each) do
    assigns[:invoice] = stub_model(Invoice,
      :new_record? => true,
      :number => 1,
      :note => "value for note"
    )
  end

  # it "renders new invoice form" do
  #   render
  # 
  #   response.should have_tag("form[action=?][method=post]", invoices_path) do
  #     with_tag("input#invoice_number[name=?]", "invoice[number]")
  #     with_tag("textarea#invoice_note[name=?]", "invoice[note]")
  #   end
  # end
end
