namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    # require 'populator'
    # require 'faker'
    
    [Client].each(&:delete_all)
    
    Client.populate 20 do |client|
      client.name    = Faker::Name.name
      client.email   = Faker::Internet.email
      client.address = "#{Faker::Address.street_address}\n
                        #{Faker::Address.city}\n
                        #{Faker::Address.us_state_abbr}\n
                        #{Faker::Address.zip_code}"
      client.phone   = Faker::PhoneNumber.phone_number
      client.fax     = Faker::PhoneNumber.phone_number
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