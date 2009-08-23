class Client < ActiveRecord::Base
  # Associations
  has_many :invoices
  has_one :address
  
  # Validations
  validates_presence_of :email
  
  accepts_nested_attributes_for :address, :reject_if => lambda { |attributes| attributes.values.all?(&:blank?) }, :allow_destroy => true
  
  # Logic
  def amount_due
    total = 0
    invoices.collect(&:amount_due).each { |amount| total += amount }
    total
  end
  
  def name
    "#{first_name} #{last_name}" if first_name.present? && last_name.present?
  end
  
  def number_of_pending_invoices
    invoices.pending.size
  end
end
