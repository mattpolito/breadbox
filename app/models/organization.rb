class Organization < ActiveRecord::Base
  include Calculation
  
  # Extensions
  # authenticates_many :user_sessions
  
  normalize :email, with: :downcase
  normalize :email, :name
  normalize :phone, :fax do |number|
    if number.is_a?(String) && number.present?
      number.gsub(/\W/, '').gsub(/^1/, '').gsub('x', '')
    else
      nil
    end
  end
  
  # Associations
  has_many :users
  has_many :clients
  has_many :invoices, :through => :clients
  has_one :address, :as => :addressable
  belongs_to :account
  
  accepts_nested_attributes_for :address, :reject_if => lambda { |attributes| attributes.values.all?(&:blank?) }, :allow_destroy => true
  
  # Logic  
  def next_invoice_number
    @next_invoice_number || calculate_next_invoice_number
  end
  
  def previous_invoice_number
    @previous_invoice_number || calculate_next_invoice_number - 1
  end

  def yearly_estimated_income
    collection_total(invoices.for_this_year, :total_amount)
  end
  
  private  
    def calculate_next_invoice_number
      last_used = invoices.map(&:number).compact.sort.last unless invoices.blank?
      last_used.present? ? last_used + 1 : 1
    end
end
