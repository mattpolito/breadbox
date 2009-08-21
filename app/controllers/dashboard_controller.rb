class DashboardController < ApplicationController
  def index
    @overdue_invoices = Invoice.overdue
    @new_invoices = Invoice.newly_created(5).order('created_at DESC').limit(10)
    @sent_invoices = Invoice.sent.limit(10)
    @paid_invoices = Invoice.paid.limit(10)
    @estimated_total_for_year = Invoice.yearly_estimated_income
  end
end
