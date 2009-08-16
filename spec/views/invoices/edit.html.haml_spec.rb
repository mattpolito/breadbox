require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/invoices/edit.html.haml" do
  include InvoicesHelper

  before(:each) do
    assigns[:invoice] = @invoice = stub_model(Invoice,
      :new_record? => false,
      :number => 1,
      :note => "value for note"
    )
  end

  # it "renders the edit invoice form" do
  #   render
  # 
  #   response.should have_tag("form[action=#{invoice_path(@invoice)}][method=post]") do
  #     with_tag('input#invoice_number[name=?]', "invoice[number]")
  #     with_tag('textarea#invoice_note[name=?]', "invoice[note]")
  #   end
  # end
end
