class Organization < ActiveRecord::Base
  # Extensions
  authenticates_many :user_sessions
  
  # Associations
  has_many :users
  has_many :clients
  has_many :invoices, :through => :clients
  has_one :address, :as => :addressable
  belongs_to :account
  
    accepts_nested_attributes_for :address, :reject_if => lambda { |attributes| attributes.values.all?(&:blank?) }, :allow_destroy => true
end
