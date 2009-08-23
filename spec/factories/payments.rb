Factory.define :payment do |f|
  f.amount 1000
  f.source 'check'
  f.association :invoice
end