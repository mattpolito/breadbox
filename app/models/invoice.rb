class Invoice < ActiveRecord::Base
  # Associatins
  belongs_to :client
  
  # Validations
  validates_presence_of :number
  
  # Logic
  def next_available_number
    Invoice.maximum('number') + 1
  end
  
end
