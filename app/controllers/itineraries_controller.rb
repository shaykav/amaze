class ItinerariesController < ApplicationController

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)

    if @itinerary.save
      # TODO add strong params
      locations = params[:itinerary][:content]
      if locations.present? and locations.any?
        locations.each do |lo|
          location = @itinerary.locations.build
          location.title = lo['title']
          location.description = lo["description"] 
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
      redirect_to @itinerary
    else
      render :new
    end
  end


  private
  def itinerary_params 
    params.require(:itinerary).permit(:content, :title, :description)
  end

end
