class SettingsController < ApplicationController
  # /settings
  def index
    current_organization.build_address unless current_organization.address.present?
  end
end