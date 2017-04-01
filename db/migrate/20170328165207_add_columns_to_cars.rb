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
    add_column :cars, :liability, :decimal, :precision => 8, :scale => 2
    add_column :cars, :comprehensive_part, :decimal, :precision => 8, :scale => 2
    add_column :cars, :comprehensive_full, :decimal, :precision => 8, :scale => 2
    add_column :cars, :tax, :decimal, :precision => 8, :scale => 2
    add_column :cars, :sold, :boolean
    add_column :cars, :sold_date, :date
    add_column :cars, :sale_price, :decimal, :precision => 8, :scale => 2
    add_column :cars, :buyer, :string
  end
end
