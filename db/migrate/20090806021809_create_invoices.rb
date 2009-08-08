class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :number
      t.date :payment_due_date
      t.text :note
      t.date :billing_date

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
