class Client < ActiveRecord::Base
  # Extensions
  # has_gravatar :size => 75, :default => 'http://breadbox.local/images/gravatar_default.png'
  
  normalize_attributes :email, :first_name, :last_name, :company_name
  normalize_attributes :phone, :fax do |number|
    if number.is_a?(String) && number.present?
      number.gsub(/\W/, '').gsub(/^1/, '').gsub('x', '')
    else
      nil
    end
  end
  
  # Associations
  has_many :invoices
  has_one :address, :as => :addressable
  belongs_to :organization
  
  # Validations
  validates_presence_of :email
  
  accepts_nested_attributes_for :address, :reject_if => lambda { |attributes| attributes.values.all?(&:blank?) }, :allow_destroy => true
  
  # Logic
  def amount_due
    total = 0
    invoices.pending.collect(&:amount_due).each { |amount| total += amount }
    total
  end
  
  def name
    "#{first_name} #{last_name}" if first_name.present? && last_name.present?
  end
  
  def number_of_pending_invoices
    invoices.pending.size
  end
end
