class AddItinerariesToNeighborhoods < ActiveRecord::Migration[5.1]
  def change
    add_reference :neighborhoods, :itinerary, foreign_key: true
  end
end
