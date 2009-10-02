class AddressToPolymorphic < ActiveRecord::Migration
  def self.up
    add_column :addresses, :addressable_id, :integer
    add_column :addresses, :addressable_type, :string
    
    addresses = Address.all
    addresses.each do |address| 
      address.update_attributes :addressable_type => 'Client', :addressable_id => address.client_id
    end
    
    remove_column :addresses, :client_id
  end

  def self.down
    remove_column :addresses, :addressable_type
    remove_column :addresses, :addressable_id
    add_column :addresses, :client_id, :integer
  end
end
