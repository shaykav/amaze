class Itinerary < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user

  has_many :neighborhood_itineraries
  has_many :neighborhoods, through: :neighborhood_itineraries

  accepts_nested_attributes_for :neighborhood_itineraries

  attr_accessor :content

  validates :title, :description, :image, presence: true

  has_attached_file :image, styles: { medium: "600x600>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


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
        location.title = lo['title']
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
