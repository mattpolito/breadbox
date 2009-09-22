class Account < ActiveRecord::Base
  # Callbacks
  before_save :ensure_subdomain_is_lowercase
  
  # Validations
  validates_presence_of :subdomain
  validates_uniqueness_of :subdomain
  validates_format_of :subdomain, :with => /^([a-z]|[0-9]|-)*$/
  
  private
    def ensure_subdomain_is_lowercase
      self.subdomain = subdomain.downcase
    end
end
