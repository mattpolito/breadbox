class DashboardController < ApplicationController
  def index
    @overdue_invoices = Invoice.overdue
    @new_invoices = Invoice.newly_created(5).order('created_at DESC')
    @estimated_total_for_year = Invoice.yearly_estimated_income
  end
end
