module Cleansing
  def strip_non_numeric(amount)
    amount.gsub(/\$|\,/, '')
  end
end