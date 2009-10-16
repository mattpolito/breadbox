class Notification < ActionMailer::Base
  def self.deliver_message(options)
    send("send_#{options[:type]}", options)
    
    # case options[:type]
    # when 'invoice'
    #   send_invoice(options)
    # end
  end
  
  def self.send_invoice(options)
    invoice = Invoice.find(options[:id])
    invoice.sent!
    # deliver_invoice(invoice)
  end
  
  def self.send_reminder(options)
    invoice = Invoice.find(options[:id])
    # send("deliver_#{options[:type]}_reminder", invoice)
  end
  
  def invoice(invoice)
    recipients  invoice.client.email
    from        invoice.organization.email
    subject     "[#{invoice.organization.name}] Invoice for requested work"
    sent_on     Time.now
    body        :invoice => invoice
  end
  
end