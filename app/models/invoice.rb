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
  
  # Associations
  belongs_to :client
  has_many :invoice_lines, :dependent => :destroy
  
  # Scopes
  named_scope :overdue, lambda { { :conditions => ["payment_due_date < :current_date AND status = 'sent'", { :current_date => Date.today.to_s(:db) }] } }
  named_scope :for_this_year, lambda { { :conditions => ["billing_date > :current_year", { :current_year => Date.today.at_beginning_of_year.to_s(:db) }] } }
  named_scope :newly_created, lambda { |days| { :conditions => ["created_at > :time_period", { :time_period => (Date.today - days).to_s(:db) }] } }
  named_scope :order, lambda { |order| { :order => order } }
  named_scope :pending, :conditions => ["status = 'draft' OR status = 'sent'"]
  
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
  
  def self.yearly_estimated_income
    total = 0
    for_this_year.collect(&:total_amount).each { |amount| total += amount }
    total
  end
  
end
