class AddClientInvoiceAssociation < ActiveRecord::Migration
  def self.up
    add_column :invoices, :client_id, :integer
  end

  def self.down
    remove_column :invoices, :client_id
  end
end
