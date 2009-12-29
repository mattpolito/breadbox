module Calculation
  def collection_total(collection, attribute)
    total = 0
    collection.map(&attribute).each { |amount| total += amount }
    total
  end
end