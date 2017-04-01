class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    change_column :refuellings, :price_per_liter, :decimal, :precision => 8, :scale => 2
    rename_column :refuellings, :price_per_liter, :cents_per_liter
  end
end