Fabricator(:payment) do
  amount 1000
  source 'check'
  association :invoice
end
