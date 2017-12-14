class Itinerary < ApplicationRecord
  has_many :locations
  belongs_to :user
  attr_accessor :content


  def self.location_parse_save(locations, itinerary)
    if locations.present? and locations.any?
      locations.each do |lo|
        location = itinerary.locations.build
        location.title = lo['title']
        location.description = lo["description"]
        unless lo["location"].empty?
          parsed_loc = JSON.parse(lo["location"]).symbolize_keys!
          if parsed_loc.present? and parsed_loc.key?(:lat) and parsed_loc.key?(:lng)
            location.latitude = parsed_loc[:lat]
            location.longitude = parsed_loc[:lng]
            # location.photo = 
          end
        end
        location.save
      end
    end
  end

end
