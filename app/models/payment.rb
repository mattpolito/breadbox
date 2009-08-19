class Payment < ActiveRecord::Base
  # Associations
  belongs_to :invoice
end
