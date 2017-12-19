class Neighborhood < ApplicationRecord
  has_many :neighborhood_itineraries
  has_many :itineraries, through: :neighborhood_itineraries
end
