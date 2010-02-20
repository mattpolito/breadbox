class AddTotalAmountToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :total_amount, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :invoices, :total_amount
  end
end
