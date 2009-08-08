class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :phone
      t.string :fax

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
