Fabricator(:client) do
  first_name Faker::Name.first_name
  last_name Faker::Name.last_name
  email { sequence(:email) { |i| "client#{i}@example.com" } }
  phone Faker::PhoneNumber.phone_number
  fax Faker::PhoneNumber.phone_number
end
