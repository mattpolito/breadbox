class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.xml
  def index
    @clients = current_organization.clients.paginate(:all, :order => 'last_name', :page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    @client = current_organization.clients.find(params[:id])
    @invoices = @client.invoices

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @client = current_organization.clients.new
    @client.build_address

    respond_to do |format|
      format.html # new.html.erb
      format.js { render :partial => 'clients/new_form' }
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = current_organization.clients.find(params[:id])
    @client.build_address unless @client.address.present?
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = current_organization.clients.new(params[:client])

    respond_to do |format|
      if @client.save
        add_success 'Client was successfully created.'
        format.html { redirect_to(@client) }
        format.xml  { render :xml => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = current_organization.clients.find(params[:id])
    
    respond_to do |format|
      if @client.update_attributes(params[:client])
        add_success 'Client was successfully updated.'
        format.html { redirect_to(@client) }
        format.xml  { head :ok }
      else
        format.html { render :edit }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = current_organization.clients.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to(clients_url) }
      format.xml  { head :ok }
    end
  end
end
