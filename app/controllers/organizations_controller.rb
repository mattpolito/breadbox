class OrganizationsController < ApplicationController
  
  def edit
    current_organization.build_address unless current_organization.address.present?
  end
  
  def update
    if current_organization.update_attributes(params[:organization])
      add_success "Organization settings updated!"
      redirect_to settings_path
    else
      render :edit
    end
  end
end