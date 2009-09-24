class Organization < ActiveRecord::Base
  # Associations
  has_many :users
  has_many :clients
  has_many :invoices, :through => :clients
  belongs_to :account
end
