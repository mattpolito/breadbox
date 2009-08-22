class PaymentsController < ApplicationController
  before_filter :find_invoice
  
  def new
    @payment = @invoice.payments.new
  end
  
  def create
    @payment = @invoice.payments.new(params[:id])
    if @payment.save!
      add_success "Payment has been added invoice ##{@invoice.number}"
      redirect_to @invoice
    end
  end
  
  private
    def find_invoice
      @invoice = Invoice.find(params[:invoice_id])
    end
end
