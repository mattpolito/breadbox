class ChangePriceToPriceInCentsOnInvoiceLines < ActiveRecord::Migration
  def self.up
    rename_column :invoice_lines, :price, :price_in_cents
  end

  def self.down
    rename_column :invoice_lines, :price_in_cents, :price
  end
end
