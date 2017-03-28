class AddColumnsToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :car_brand, :string
    add_column :cars, :registrationdate, :date
    add_column :cars, :milage_purchase_date, :integer
    add_column :cars, :fuel_type, :string
    add_column :cars, :cubic_capacity, :integer
    add_column :cars, :engine_power, :integer
    add_column :cars, :numberplate, :string
  end
end
