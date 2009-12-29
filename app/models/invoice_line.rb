class InvoiceLine < ActiveRecord::Base
  # Callbacks
  before_save :calculate_total_amount
  
  # Associations
  belongs_to :invoice
  
  # Validations
  validates_presence_of :quantity
  
  # Logic
  def price
    (price_in_cents.to_f / 100) unless price_in_cents.blank?
  end
  
  def price=(price)
    self.price_in_cents = (price.to_f * 100).to_i unless price.blank?
  end
  
  private
    def calculate_total_amount
      self.total_amount = quantity * price_in_cents
    end
end
