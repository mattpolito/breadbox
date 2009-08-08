Factory.sequence :number do |s|
  s
end

Factory.define :invoice do |f|
  f.number { Factory.next(:number) }
  f.payment_due_date Date.today
  f.note 'This is a note'
  f.billing_date Date.today + 1.week
end