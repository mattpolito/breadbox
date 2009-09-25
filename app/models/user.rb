class User < ActiveRecord::Base
  # Extensions
  acts_as_authentic
  has_gravatar :size => 75
  normalize_attributes :first_name, :last_name, :email, :current_login_ip, :last_login_ip, :current_login_ip
  
  # Validations
  validates_presence_of :first_name
  validates_presence_of :last_name  
  
  # Logic
  def name
    "#{first_name} #{last_name}" if first_name.present? && last_name.present?
  end
end
