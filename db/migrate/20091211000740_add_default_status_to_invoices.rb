class AddDefaultStatusToInvoices < ActiveRecord::Migration
  def self.up
    change_column_default :invoices, :status, 'draft'
  end

  def self.down
    change_column_default :invoices, :status, nil
  end
end
