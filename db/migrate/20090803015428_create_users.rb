class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string      :first_name
      t.string      :last_name
      t.string      :email
      t.string      :crypted_password
      t.string      :password_salt
      t.string      :persistence_token, :null => false
      t.string      :perishable_token, :null => false
      t.string      :current_login_ip
      t.string      :last_login_ip
      t.integer     :login_count, :null => false, :default => 0
      t.integer     :failed_login_count, :null => false, :default => 0
      t.datetime    :last_request_at
      t.datetime    :last_login_at
      t.datetime    :current_login_at
      t.timestamps
    end
    
    add_index :users, :persistence_token
    add_index :users, :last_request_at
    add_index :users, :perishable_token
    add_index :users, :email
  end

  def self.down
    drop_table :users
  end
end
