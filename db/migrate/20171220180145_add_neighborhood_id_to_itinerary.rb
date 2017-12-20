class AddNeighborhoodIdToItinerary < ActiveRecord::Migration[5.1]
  def change
    add_reference :itineraries, :neighborhood, foreign_key: true
  end
end
