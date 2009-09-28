module InvoicesHelper
  def overdue(invoice)
    invoice.overdue? ? 'overdue' : false
  end
  
  def payment_notice(invoice)
    content_tag :p, :class => 'notice' do
      string = "A payment in the amount of "
      string += content_tag :strong do
        h(cents_to_dollars(invoice.amount_due))
      end
      string += " #{invoice.is_or_was} due on "
      string += content_tag :strong do
        h(long_date(invoice.payment_due_date))
      end
      string
    end
  end
end
