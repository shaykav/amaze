class ItinerariesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def show
    @itinerary = Itinerary.last
    @locations = Itinerary.last.locations
  end

  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end


  def create
    @itinerary = Itinerary.new(itinerary_params)

    if @itinerary.save
      # TODO add strong params
      locations = params[:itinerary][:content]
      byebug

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
