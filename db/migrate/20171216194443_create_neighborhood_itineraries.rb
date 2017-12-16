class CreateNeighborhoodItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :neighborhood_itineraries do |t|
      t.references :neighborhood, foreign_key: true
      t.references :itinerary, foreign_key: true

      t.timestamps
    end
  end
end
