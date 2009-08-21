class User < ActiveRecord::Base
  acts_as_authentic
  
  # Logic
  def name
    "#{first_name} #{last_name}" if first_name.present? && last_name.present?
  end
end
