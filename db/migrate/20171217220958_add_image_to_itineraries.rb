class AddImageToItineraries < ActiveRecord::Migration[5.1]
  def up
    add_attachment :itineraries, :image
  end

  def down
    remove_attachment :itineraries, :image
  end
end
