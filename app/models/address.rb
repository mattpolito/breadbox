class Address < ActiveRecord::Base
  # Extensions
  apply_addresslogic :fields => [:street1, :street2, :city, [:state, :zipcode], :country]
  
  # Associations
  belongs_to :addressable, :polymorphic => true
  
  # Validations
  validates_presence_of :street1
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode
end
