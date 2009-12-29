class AddTotalAmountToInvoiceLines < ActiveRecord::Migration
  def self.up
    add_column :invoice_lines, :total_amount, :integer
  end

  def self.down
    remove_column :invoice_lines, :total_amount
  end
end
