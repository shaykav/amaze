class Neighborhood < ApplicationRecord
  # has_many :itineraries
  belongs_to :itineraries
  # has_many :neighborhood_itineraries
  # has_many :itineraries, through: :neighborhood_itineraries
end
