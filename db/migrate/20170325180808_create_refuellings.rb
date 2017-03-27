class CreateRefuellings < ActiveRecord::Migration[5.0]
  def change
    create_table :refuellings do |t|
      t.date :refuel_date
      t.integer :milage
      t.float :price_per_liter
      t.string :filling_station
      t.string :location
      t.float :liters
      t.references :car, foreign_key: true
      t.timestamps
    end
    change_column :refuellings, :price_per_liter, :integer
    rename_column :refuellings, :price_per_liter, :cents_per_liter
    add_index :refuellings, [:car_id, :created_at]
  end
end
