module InvoicesHelper
  def overdue?(invoice)
    invoice.overdue? ? 'overdue' : ''
  end
end
