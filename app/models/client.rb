class Client < ActiveRecord::Base
  # Associations
  has_many :invoices
  has_one :address
  
  # Validations
  validates_presence_of :name
  validates_presence_of :email
  
  accepts_nested_attributes_for :address, :reject_if => lambda { |attributes| attributes.values.all?(&:blank?) }, :allow_destroy => true
  
  # Logic
  def number_of_pending_invoices
    invoices.pending.size
  end
end
