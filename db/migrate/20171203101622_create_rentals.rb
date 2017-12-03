class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.string :customer
      t.date :rental_date_out
      t.date :rental_date_return
      t.integer :milage_out
      t.integer :milage_return
      t.float :amount_refuelled
      t.text :description
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
