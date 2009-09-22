Factory.sequence :subdomain do |s|
  "reactioncontrol#{s}"
end

Factory.sequence :bad_subdomain do |s|
  "reactionCONTROL#{s}"
end

Factory.define :account do |f|
  f.subdomain { Factory.next(:subdomain) }
end

Factory.define :bad_account, :parent => :account do |f|
  f.subdomain { Factory.next(:bad_subdomain) }
end