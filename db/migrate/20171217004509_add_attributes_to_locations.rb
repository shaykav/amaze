class AddAttributesToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :website, :string
    add_column :locations, :address, :string
    add_column :locations, :icon, :string
  end
end
