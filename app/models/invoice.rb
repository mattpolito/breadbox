class Invoice < ActiveRecord::Base
  # Extensions
  include AASM
  aasm_column :status
  aasm_initial_state :draft
  aasm_state :draft
  aasm_state :sent
  aasm_state :paid
  aasm_state :closed
  
  aasm_event :sent do
    transitions :to => :sent, :from => [:draft]
  end
  
  aasm_event :paid do
    transitions :to => :paid, :from => [:sent, :draft]
  end
  
  aasm_event :close do
    transitions :to => :closed, :from => [:draft, :sent, :paid]
  end
  
  # Associatins
  belongs_to :client
  has_many :invoice_lines, :dependent => :destroy
  
  accepts_nested_attributes_for :invoice_lines
  
  # Validations
  validates_presence_of :number
  validates_uniqueness_of :number
  
  # Logic  
  def last_used_number
    max = Invoice.maximum('number')
    max.present? ? max : 0
  end
  
  def total_amount
    total = 0
    invoice_lines.collect(&:total_amount).each { |amount| total += amount }
    total
  end
  
end
