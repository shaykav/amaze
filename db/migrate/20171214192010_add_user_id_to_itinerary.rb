class AddUserIdToItinerary < ActiveRecord::Migration[5.1]
  def change
    add_reference :itineraries, :user, foreign_key: true
  end
end
