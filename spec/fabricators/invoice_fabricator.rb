Fabricator(:invoice) do
  number { sequence(:number, 1111) }
  payment_due_date Date.today
  note 'Note'
  billing_date Date.today + 1.week
end
