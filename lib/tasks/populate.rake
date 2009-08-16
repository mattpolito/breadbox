namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    # require 'populator'
    # require 'faker'
    
    [Client, Invoice, InvoiceLine].each(&:delete_all)
    
    Client.populate 20 do |client|
      client.name    = Faker::Name.name
      client.email   = Faker::Internet.email
      client.address = "#{Faker::Address.street_address}\n
                        #{Faker::Address.city}\n
                        #{Faker::Address.us_state_abbr}\n
                        #{Faker::Address.zip_code}"
      client.phone   = Faker::PhoneNumber.phone_number
      client.fax     = Faker::PhoneNumber.phone_number
      
      Invoice.populate 2..5 do |invoice|
        invoice.number           = 1..5000
        invoice.billing_date     = (Date.today - 5.days)..(Date.today + 2.weeks)
        invoice.payment_due_date = invoice.billing_date..(Date.today + 2.weeks)
        invoice.note             = Populator.paragraphs(0..3)
        invoice.client_id        = client.id
        invoice.status           = ['draft', 'sent', 'paid']
                
        InvoiceLine.populate 1..4 do |invoice_line|
          invoice_line.description = Populator.sentences(0..2)
          invoice_line.quantity    = 1..5
          invoice_line.price       = [25, 50, 65]
          invoice_line.invoice_id  = invoice.id
        end
      end
    end
    
    
    
    # Product.populate 10..100 do |product|
    #   product.category_id = category.id
    #   product.name = Populator.words(1..5).titleize
    #   product.description = Populator.sentences(2..10)
    #   product.price = [4.99, 19.95, 100]
    #   product.created_at = 2.years.ago..Time.now
    # end
    
    # Person.populate 100 do |person|
    #   person.name    = Faker::Name.name
    #   person.company = Faker::Company.name
    #   person.email   = Faker::Internet.email
    #   person.phone   = Faker::PhoneNumber.phone_number
    #   person.street  = Faker::Address.street_address
    #   person.city    = Faker::Address.city
    #   person.state   = Faker::Address.us_state_abbr
    #   person.zip     = Faker::Address.zip_code
    # end
  end
end