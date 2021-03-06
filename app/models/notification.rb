class Notification < ActionMailer::Base
  helper :application
  
  def self.deliver_message(options)
    send("send_#{options[:type]}", options)
  end
  
  def self.send_invoice(options)
    invoice = Invoice.find(options[:id])
    deliver_invoice(invoice)
    invoice.sent!
  end
  
  def self.send_reminder(options)
    invoice = Invoice.find(options[:id])
    deliver_reminder(invoice)
  end
  
  def invoice(invoice)
    css         :'emails/invoice'
    recipients  invoice.client.email
    from        Settings.noreply_address
    subject     "[#{invoice.organization.name}] Invoice for requested work"
    sent_on     Time.now
    body        :invoice => invoice, :organization => invoice.organization, 
                :client => invoice.client
  end
  
  def reminder(invoice)
    css         :'emails/reminder'
    recipients  invoice.client.email
    from        Settings.noreply_address
    subject     "[#{invoice.organization.name}] Invoice ##{invoice.number} payment reminder"
    sent_on     Time.now
    body        :invoice => invoice, :organization => invoice.organization, 
                :client => invoice.client
  end
  
end