class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessor :password_confirmation
  # Extensions
  # acts_as_authentic do |authenticate|
  #   authenticate.validations_scope = :organization_id
  # end
  # has_gravatar :size => 75
  normalize_attributes :first_name, :last_name, :email, :current_login_ip, :last_login_ip, :current_login_ip
  
  # Associations
  belongs_to :organization
  
  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  
  # Logic
  def name
    "#{first_name} #{last_name}" if first_name.present? && last_name.present?
  end
end
