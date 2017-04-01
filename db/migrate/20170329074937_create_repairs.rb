class CreateRepairs < ActiveRecord::Migration[5.0]
  def change
    create_table :repairs do |t|
      t.date :repair_date
      t.string :title
      t.text :description
      t.decimal :billings_amount, :precision => 8, :scale => 2
      t.string :garage
      t.references :car, foreign_key: true

      t.timestamps
    end
    add_index :repairs, [:car_id, :created_at]
  end
end
