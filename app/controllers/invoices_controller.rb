class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.xml
  def index
    @invoices = Invoice.paginate(:all, :order => 'billing_date', :page => params[:page])
  end

  # GET /invoices/1
  # GET /invoices/1.xml
  def show
    @invoice = Invoice.find(params[:id])
  end

  # GET /invoices/new
  # GET /invoices/new.xml
  def new
    @invoice = Invoice.new
    @clients = Client.all
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
    @clients = Client.all
  end

  # POST /invoices
  # POST /invoices.xml
  def create
    @invoice = Invoice.new(params[:invoice])
    
    if @invoice.save
      add_notice 'Invoice was successfully created.'
      redirect_to(@invoice)
    else
      render :new
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.xml
  def update
    @invoice = Invoice.find(params[:id])
    
    if @invoice.update_attributes(params[:invoice])
      add_notice 'Invoice was successfully updated.'
      redirect_to(@invoice)
    else
      render :edit
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.xml
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    
    redirect_to(invoices_url)
  end
end
