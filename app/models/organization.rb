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
  
  # Logic
  
  def calculate_next_invoice_number
    last_used = invoices.map(&:number).compact.sort.last unless invoices.blank?
    last_used.present? ? last_used + 1 : 1
  end
  
  def next_invoice_number
    @next_invoice_number || calculate_next_invoice_number
  end
end
