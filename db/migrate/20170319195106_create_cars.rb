class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :car_name
      t.string :car_model
      t.decimal :purchase_price, :precision => 8, :scale => 2
      t.date :purchase_date
      t.string :seller
      t.references :user, foreign_key: true

      t.timestamps
    end
  add_index :cars, [:user_id, :created_at]
  end
end
