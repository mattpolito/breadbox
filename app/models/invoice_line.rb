class InvoiceLine < ActiveRecord::Base
  # Associations
  belongs_to :invoice
  
  # Validations
  validates_presence_of :quantity
  
  # Logic
  def price
    (price_in_cents / 100).to_f unless price_in_cents.blank?
  end
  
  def price=(price)
    self.price_in_cents = price.to_i * 100 unless price.blank?
  end
  
  def total_amount
    quantity * price_in_cents
  end
end
