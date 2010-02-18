namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    # require 'populator'
    # require 'faker'
    
    [Account, Address, Client, Invoice, InvoiceLine, Organization, Payment].each(&:delete_all)
    
    # reactionCONTROL Data
    Account.populate 1 do |account|
      account.subdomain = 'reactioncontrol'
      
      Organization.populate 1 do |organization|
        organization.name       = 'reactionCONTROL'
        organization.account_id = account.id
        
        Client.populate 2..7 do |client|
          client.first_name      = Faker::Name.first_name
          client.last_name       = Faker::Name.last_name
          client.company_name    = [Faker::Company.name, nil]
          client.email           = Faker::Internet.email
          client.phone           = Faker::PhoneNumber.phone_number
          client.fax             = Faker::PhoneNumber.phone_number
          client.organization_id = organization.id

          Address.populate 1 do |address|
            address.street1          = Faker::Address.street_address
            address.street2          = [Faker::Address.secondary_address, nil]
            address.city             = Faker::Address.city
            address.state            = Faker::Address.us_state_abbr
            address.zipcode          = Faker::Address.zip_code
            address.addressable_id   = client.id
            address.addressable_type = 'Client'
          end
      
          Invoice.populate 1..5 do |invoice|
            invoice.number           = 1..5000
            invoice.billing_date     = (Date.today - 5.days)..(Date.today + 2.weeks)
            invoice.payment_due_date = invoice.billing_date..(Date.today + 2.weeks)
            invoice.note             = Populator.paragraphs(0..3)
            invoice.client_id        = client.id
            invoice.status           = ['draft', 'sent', 'paid']
                
            InvoiceLine.populate 1..4 do |invoice_line|
              invoice_line.description    = Populator.sentences(0..2)
              invoice_line.quantity       = 1..5
              invoice_line.price_in_cents = [2500, 5000, 6500]
              invoice_line.invoice_id     = invoice.id
              invoice_line.total_amount   = invoice_line.quantity * invoice_line.price_in_cents
            end
          end
        end
      end
    end

    # Fuel Collective Data
    Account.populate 1 do |account|
      account.subdomain = 'fuelcollective'
      
      Organization.populate 1 do |organization|
        organization.name       = 'Fuel Collective'
        organization.account_id = account.id
        
        Client.populate 2..7 do |client|
          client.first_name      = Faker::Name.first_name
          client.last_name       = Faker::Name.last_name
          client.company_name    = [Faker::Company.name, nil]
          client.email           = Faker::Internet.email
          client.phone           = Faker::PhoneNumber.phone_number
          client.fax             = Faker::PhoneNumber.phone_number
          client.organization_id = organization.id

          Address.populate 1 do |address|
            address.street1          = Faker::Address.street_address
            address.street2          = [Faker::Address.secondary_address, nil]
            address.city             = Faker::Address.city
            address.state            = Faker::Address.us_state_abbr
            address.zipcode          = Faker::Address.zip_code
            address.addressable_id   = client.id
            address.addressable_type = 'Client'
          end
      
          Invoice.populate 1..5 do |invoice|
            invoice.number           = 1..5000
            invoice.billing_date     = (Date.today - 5.days)..(Date.today + 2.weeks)
            invoice.payment_due_date = invoice.billing_date..(Date.today + 2.weeks)
            invoice.note             = Populator.paragraphs(0..3)
            invoice.client_id        = client.id
            invoice.status           = ['draft', 'sent', 'paid']
                
            InvoiceLine.populate 1..4 do |invoice_line|
              invoice_line.description    = Populator.sentences(0..2)
              invoice_line.quantity       = 1..5
              invoice_line.price_in_cents = [2500, 5000, 6500]
              invoice_line.invoice_id     = invoice.id
            end
          end
        end
      end
    end
  end
end