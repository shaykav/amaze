class Itinerary < ApplicationRecord
  has_many :locations
  attr_accessor :content
end
