class Client < ActiveRecord::Base
  # Associations
  has_many :invoices
  
  # Validations
  validates_presence_of :name
  validates_presence_of :email
end
