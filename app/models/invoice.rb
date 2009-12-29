class Invoice < ActiveRecord::Base
  # Extensions
  include Calculation
  
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
  
  # Accessor
  attr_accessor :due_date
  
  # Callbacks
  before_validation :set_payment_due_date, :if => :due_date
  
  # Associations
  belongs_to :client
  has_many :invoice_lines, :dependent => :destroy
  has_many :payments, :dependent => :destroy
  
  # Scopes
  named_scope :overdue, lambda { { :conditions => ["payment_due_date < :current_date AND status = 'sent'", { :current_date => Date.today.to_s(:db) }] } }
  named_scope :for_this_year, lambda { { :conditions => ["billing_date > :current_year", { :current_year => Date.today.at_beginning_of_year.to_s(:db) }] } }
  named_scope :newly_created, lambda { |days| { :conditions => ["created_at < :time_period", { :time_period => (Date.today - days).to_s(:db) }] } }
  named_scope :order, lambda { |order| { :order => order } }
  named_scope :pending, :conditions => ["status = 'draft' OR status = 'sent'"]
  named_scope :limit, lambda { |number| { :limit => (number) } }
  
  accepts_nested_attributes_for :invoice_lines, :reject_if => lambda { |attributes| attributes.values.all?(&:blank?) }, :allow_destroy => true
  
  # Validations
  validates_presence_of :number
  validates_uniqueness_of :number
  
  # Logic
  def amount_due
    total_amount - payments_total
  end
  
  def is_or_was
    payment_due_date > Date.today ? 'is' : 'was'
  end
  
  def organization
    client.organization
  end
  
  def payments_total
    collection_total(payments, :amount_in_cents)
  end
  
  def total_amount
    collection_total(invoice_lines, :total_amount)
  end
  
  def overdue?
    payment_due_date < Date.today && sent?
  end
  
  private
    def set_payment_due_date
      self.payment_due_date = Date.today + due_date.to_i.days
    end
  
end
