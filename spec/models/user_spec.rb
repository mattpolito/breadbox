require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :perishable_token => 'AVsh1SeRApPP7y5mqz_S',
      :persistence_token => '53837949324d41b7c290c8645b0c3ea241e16a9d5549ebd8444e0dc0d12ed8a353deefb3c28be5fd83baac7c387e791f481ca4383b714a5eaa4f4a10addb89da'
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
  
  context "using Authlogic" do
    it { should allow_mass_assignment_of :password }
    it { should allow_mass_assignment_of :password_confirmation }
    it { should allow_mass_assignment_of :first_name }
    it { should allow_mass_assignment_of :last_name }
    it { should allow_mass_assignment_of :email }
    # it { should not_allow_mass_assignment_of :crypted_password, :password_salt, :persistence_token, :login_count, :last_request_at, :last_login_at,
       # :current_login_at, :last_login_ip, :current_login_ip, :roles, :created_at, :updated_at, :id }
    
    
  end
end
