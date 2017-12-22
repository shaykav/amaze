class Itinerary < ApplicationRecord

  has_many :locations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  belongs_to :user
  belongs_to :neighborhood

  has_many :favorites
  has_many :favoritors, through: :favorites, source: :user

  attr_accessor :content

  validates :title, :description, :image, :neighborhood_id, presence: true

  has_attached_file :image, styles: { medium: "600x400#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
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

  def reviews_count
    return self.reviews.count
  end

end
