class Location < ApplicationRecord
  belongs_to :itinerary

  validates :title, :description, presence: true
  
end
