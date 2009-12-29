class InvoicesController < ApplicationController
  prawnto :prawn => { :top_margin => 75 }
  
  # GET /invoices
  # GET /invoices.xml
  def index
    @invoices = current_organization.invoices.paginate(:all, :order => 'number DESC', :page => params[:page])
  end

  # GET /invoices/1
  # GET /invoices/1.xml
  def show
    @invoice = Invoice.find(params[:id])
  end

  # GET /invoices/new
  # GET /invoices/new.xml
  def new
    @invoice = current_organization.invoices.new
    @invoice.invoice_lines.build
    @clients = current_organization.clients
    @next_invoice_number = current_organization.next_invoice_number
    @previous_invoice_number = current_organization.previous_invoice_number
  end

  # GET /invoices/1/edit
  def edit
    @invoice = current_organization.invoices.find(params[:id])
    @clients = current_organization.clients
  end

  # POST /invoices
  # POST /invoices.xml
  def create
    @invoice = current_organization.invoices.new(params[:invoice])
    
    if @invoice.save
      add_success 'Invoice was successfully created.'
      redirect_to(@invoice)
    else
      render :new
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.xml
  def update
    @invoice = current_organization.invoices.find(params[:id])
    
    if @invoice.update_attributes(params[:invoice])
      add_success 'Invoice was successfully updated.'
      redirect_to(@invoice)
    else
      render :edit
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.xml
  def destroy
    @invoice = current_organization.invoices.find(params[:id])
    @invoice.destroy
    
    redirect_to(invoices_url)
  end
end
