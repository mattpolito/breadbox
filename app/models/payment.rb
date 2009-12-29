class Payment < ActiveRecord::Base
  after_save :mark_invoice_as_paid, :if => :fulfills_amount_due?
  
  # Associations
  belongs_to :invoice
  
  # Validations
  validates_presence_of :amount
  
  # Logic
  def amount
    (amount_in_cents.to_f / 100) unless amount_in_cents.blank?
  end
  
  def amount=(amount)
    self.amount_in_cents = (amount.to_f * 100) unless amount.blank?
  end
  
  def mark_invoice_as_paid
    invoice.paid! unless invoice.paid?
  end
  
  def fulfills_amount_due?
    (invoice.amount_due <= 0) unless invoice.blank?
  end
  
end
