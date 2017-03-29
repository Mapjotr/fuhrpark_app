class AddPictureToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :picture, :string
  end
end
