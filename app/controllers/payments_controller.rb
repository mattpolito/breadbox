class PaymentsController < ApplicationController
  before_filter :find_invoice
  
  def new
    @payment = @invoice.payments.new
    respond_to do |format|
      format.html
      format.js { render :partial => 'payments/form' }
    end
  end
  
  def create
    @payment = @invoice.payments.new(params[:payment])
    if @payment.save!
      add_success "Payment has been made to invoice ##{@invoice.number}"
      redirect_to @invoice
    else
      render :action => 'new'
    end
  end
  
  private
    def find_invoice
      @invoice = Invoice.find(params[:invoice_id])
    end
end
