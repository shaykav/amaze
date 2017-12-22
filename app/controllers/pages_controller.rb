class PagesController < ApplicationController
  def home
    @itineraries = Itinerary.all.limit(3).sort_by(&:reviews_count).reverse
  end
end
