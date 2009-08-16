class InvoiceLine < ActiveRecord::Base
  # Associations
  belongs_to :invoice
  
  # Validations
  validates_presence_of :quantity
  
  # Logic
  def total_amount
    quantity * price
  end
end
