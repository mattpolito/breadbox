class Invoice < ActiveRecord::Base
  # Associatins
  belongs_to :client
  has_many :invoice_lines, :dependent => :destroy
  
  accepts_nested_attributes_for :invoice_lines
  
  # Validations
  validates_presence_of :number
  
  # Logic
  def last_used_number
    max = Invoice.maximum('number')
    max.present? ? max : 0
  end
  
end
