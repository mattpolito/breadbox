class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.references :client
      t.timestamps
    end
    
    remove_column :clients, :address
  end

  def self.down
    add_column :clients, :address, :text
    drop_table :addresses
  end
end
