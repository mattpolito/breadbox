Factory.define :user do |f|
  f.first_name 'First'
  f.last_name 'Last'
  f.email 'test@example.com'
  f.password 'password'
  f.password_confirmation 'password'
end

Factory.define :admin, :parent => :user do |f|
  f.admin true
end
