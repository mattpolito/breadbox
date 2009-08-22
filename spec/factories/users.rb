Factory.define :user do |f|
  f.first_name 'First'
  f.last_name 'Last'
  f.email { Factory.next :email   }
  f.password 'password'
  f.password_confirmation 'password'
end

Factory.define :admin, :parent => :user do |f|
  f.admin true
end

Factory.sequence :email do |s|
  "test#{s}@example.com"
end
