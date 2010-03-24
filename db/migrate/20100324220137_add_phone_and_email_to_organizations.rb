class AddPhoneAndEmailToOrganizations < ActiveRecord::Migration
  def self.up
    add_column :organizations, :phone, :string
    add_column :organizations, :fax, :string
    add_column :organizations, :email, :string
  end

  def self.down
    remove_column :organizations, :email
    remove_column :organizations, :fax
    remove_column :organizations, :phone
  end
end
