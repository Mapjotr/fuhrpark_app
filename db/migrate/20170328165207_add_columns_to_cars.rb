class AddColumnsToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :car_brand, :string
    add_column :cars, :registrationdate, :date
    add_column :cars, :milage_purchase_date, :integer
    add_column :cars, :fuel_type, :string
    add_column :cars, :cubic_capacity, :integer
    add_column :cars, :engine_power, :integer
    add_column :cars, :numberplate, :string
    add_column :cars, :emission_class, :string
    add_column :cars, :insurance_nr, :string
    add_column :cars, :sf_class, :string
    add_column :cars, :sf_perc, :integer
    add_column :cars, :liability, :float
    add_column :cars, :comprehensive_part, :float
    add_column :cars, :comprehensive_full, :float
    add_column :cars, :tax, :float
    add_column :cars, :sold, :boolean
    add_column :cars, :sold_date, :date
    add_column :cars, :sale_price, :integer
    add_column :cars, :buyer, :string
  end
end
