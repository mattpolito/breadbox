Fabricator(:user) do
  first_name 'First'
  last_name 'Last'
  email 'email_address'
  password 'password'
  password_confirmation 'password'
end

Fabricator(:admin, from: :user) do
  admin true
end
