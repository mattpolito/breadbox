class InvoiceLine < ActiveRecord::Base
  belongs_to :invoice
end
