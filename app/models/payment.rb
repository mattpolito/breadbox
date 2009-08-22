class Payment < ActiveRecord::Base  
  # Associations
  belongs_to :invoice
  
  # Logic
  def amount
    (amount_in_cents / 100).to_f
  end
  
  def amount=(amount)
    self.amount_in_cents = amount.to_i * 100
  end
  
end
