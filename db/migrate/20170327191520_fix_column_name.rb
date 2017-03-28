class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    change_column :refuellings, :price_per_liter, :integer
    rename_column :refuellings, :price_per_liter, :cents_per_liter
  end
end