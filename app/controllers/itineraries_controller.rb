class ItinerariesController < ApplicationController




  def show
    @itinerary = Itinerary.last
  end

  def new
    @itinerary = Itinerary.new
  end


  def create
    @itinerary = Itinerary.new(itinerary_params)

    if @itinerary.save
      # TODO add strong params
      locations = params[:itinerary][:content]

      Itinerary.location_parse_save(locations, @itinerary)

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
