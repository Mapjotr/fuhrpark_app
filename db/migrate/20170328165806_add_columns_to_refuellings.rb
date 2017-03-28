class AddColumnsToRefuellings < ActiveRecord::Migration[5.0]
  def change
    add_column :refuellings, :filled_up, :boolean
  end
end
