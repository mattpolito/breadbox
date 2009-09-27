class Organization < ActiveRecord::Base
  # Extensions
  authenticates_many :user_sessions
  
  # Associations
  has_many :users
  has_many :clients
  has_many :invoices, :through => :clients
  belongs_to :account
end
