class Account < ActiveRecord::Base
  # Callbacks
  before_validation :ensure_subdomain_is_lowercase
  
  # Validations
  validates_presence_of :subdomain
  validates_uniqueness_of :subdomain, :case_sensitive => false
  validates_format_of :subdomain, :with => /^[a-z0-9-]+$/
  validates_exclusion_of :subdomain, :in => %w( support blog www billing help api ), :message => "The subdomain <strong>{{value}}</strong> is reserved and unavailable."
  
  private
    def ensure_subdomain_is_lowercase
      self.subdomain.downcase! if attribute_present?("subdomain")
    end
end
