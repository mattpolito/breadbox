class SplitClientNameIntoMultipleFields < ActiveRecord::Migration
  def self.up
    remove_column :clients, :name
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :company_name, :string
  end

  def self.down
    add_column :clients, :name, :string
    remove_column :clients, :company_name
    remove_column :clients, :last_name
    remove_column :clients, :first_name
  end
end
