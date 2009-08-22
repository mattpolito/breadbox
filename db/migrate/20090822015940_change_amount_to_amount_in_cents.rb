class ChangeAmountToAmountInCents < ActiveRecord::Migration
  def self.up
    rename_column :payments, :amount, :amount_in_cents
  end

  def self.down
    rename_column :payments, :amount_in_cents, :amount
  end
end
