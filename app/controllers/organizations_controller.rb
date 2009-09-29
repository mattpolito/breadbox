class OrganizationsController < ApplicationController
  
  def update
    current_organization.build_address unless current_organization.address.present?
    if current_organization.update_attributes(params[:organization])
      add_success "Organization settings updated!"
      redirect_to settings_path
    end
  end
end