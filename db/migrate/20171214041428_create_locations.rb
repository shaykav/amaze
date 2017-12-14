class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :title
      t.text :description
      t.integer :length_of_time
      t.string :latitude
      t.string :longitude
      t.references :itinerary, foreign_key: true

      t.timestamps
    end
  end
end
