Fabricator(:account) do
  subdomain { sequence(:subdomain) { |i| "reactioncontrol#{i}" } }
end

Fabricator(:bad_account, from: :account) do
  subdomain { sequence(:subdomain) { |i| "reactionCONTROL#{i}" } }
end
