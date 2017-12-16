class ChangeLengthOfTimeForLocations < ActiveRecord::Migration[5.1]
  def change

    rename_column :locations, :length_of_time, :photo
    change_column :locations, :photo, :string

  end
end
