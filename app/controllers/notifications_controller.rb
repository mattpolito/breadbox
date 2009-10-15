class NotificationsController < ApplicationController
  
  # /deliver/estimates/1
  # /deliver/invoices/1
  # /deliver/reminder/1
  def deliver
    Notification.deliver_message(:type => params[:type], :id => params[:id])
    add_notice "#{params[:type].humanize} has been sent!"
    redirect_to :back
  end
  
end