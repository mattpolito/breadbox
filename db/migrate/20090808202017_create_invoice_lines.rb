class CreateInvoiceLines < ActiveRecord::Migration
  def self.up
    create_table :invoice_lines do |t|
      t.text :description
      t.integer :quantity
      t.integer :price
      t.references :invoice

      t.timestamps
    end
  end

  def self.down
    drop_table :invoice_lines
  end
end
