module InvoicesHelper
  def overdue?(invoice)
    invoice.overdue? ? 'overdue' : false
  end
end
