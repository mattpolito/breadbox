class DashboardController < ApplicationController
  before_filter :require_user
  
  def index
    @overdue_invoices = Invoice.overdue
    @open_invoices = Invoice.draft.limit(10)
    @sent_invoices = Invoice.sent.limit(10)
    @paid_invoices = Invoice.paid.limit(10)
    @estimated_total_for_year = Invoice.yearly_estimated_income
    @total_paid_invoices_count = Invoice.paid.size
    @total_sent_invoices_count = Invoice.sent.size
    @total_open_invoices_count = Invoice.draft.size
  end
end
