module InvoicesHelper
  def due_date_options
    [['on receipt', 0], ['in 7 days', 7], ['in 15 days', 15], ['in 30 days', 30], ['in 45 days', 45]]
  end
  
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
