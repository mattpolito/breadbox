class DashboardController < ApplicationController
  def index
    @overdue_invoices = current_organization.invoices.overdue
    @open_invoices = current_organization.invoices.draft.limit(10)
    @sent_invoices = current_organization.invoices.sent.limit(10)
    @paid_invoices = current_organization.invoices.paid.limit(10)
    @estimated_total_for_year = current_organization.invoices.yearly_estimated_income
    @total_paid_invoices_count = current_organization.invoices.paid.size
    @total_sent_invoices_count = current_organization.invoices.sent.size
    @total_open_invoices_count = current_organization.invoices.draft.size
  end
end
