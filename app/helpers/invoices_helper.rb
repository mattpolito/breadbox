module InvoicesHelper
  def overdue?(invoice)
    invoice.overdue? ? 'overdue' : false
  end
  
  def payment_notice(invoice)
    content_tag :p, :class => 'notice' do
      string = "A payment in the amount of "
      string += content_tag :strong do
        h(cents_to_dollars(invoice.total_amount))
      end
      string += " was due on "
      string += content_tag :strong do
        h(invoice.payment_due_date.to_s(:regular))
      end
      string
    end
  end
end
