class ItinerariesController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :authenticate_user!, only: [:new, :create]

  def show
  end

  def manage_itineraries
    @itineraries = Itinerary.where(user: current_user).order("created_at DESC")
  end

  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end


  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user_id = current_user.id

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

  def set_product
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:content, :title, :description)
  end

end
