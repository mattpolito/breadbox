class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :amount
      t.string :source
      t.text :note
      t.references :invoice
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
