class AddOrganizationIdToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :organization_id, :integer
  end

  def self.down
    remove_column :clients, :organization_id
  end
end
