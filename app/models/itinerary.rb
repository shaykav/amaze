class Itinerary < ApplicationRecord
  has_many :locations
  has_many :reviews, as: :reviewable
  belongs_to :user

  has_many :neighborhood_itineraries
  has_many :neighborhoods, through: :neighborhood_itineraries

  accepts_nested_attributes_for :neighborhood_itineraries

  attr_accessor :content

  validates :title, :description, presence: true


  def self.location_parse_save(locations, itinerary)
    if locations.present? and locations.any?
      locations.each do |lo|
        location = itinerary.locations.build
        location.title = lo['title']
        location.description = lo["description"]
        location.photo = lo['photo']
        location.icon = lo['icon']
        location.address = lo['address']
        location.website = lo['website']
        unless lo["location"].empty?
          parsed_loc = JSON.parse(lo["location"]).symbolize_keys!
          if parsed_loc.present? and parsed_loc.key?(:lat) and parsed_loc.key?(:lng)
            location.latitude = parsed_loc[:lat]
            location.longitude = parsed_loc[:lng]
          end
        end
        location.save
      end
    end
  end

end
