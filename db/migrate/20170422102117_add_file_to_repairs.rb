class AddFileToRepairs < ActiveRecord::Migration[5.0]
  def change
    add_column :repairs, :file, :string
  end
end
