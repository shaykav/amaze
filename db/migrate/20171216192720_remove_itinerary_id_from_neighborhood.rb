class RemoveItineraryIdFromNeighborhood < ActiveRecord::Migration[5.1]
  def change
    remove_column :neighborhoods, :itinerary_id, :bigint
  end
end
