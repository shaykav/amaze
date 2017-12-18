class ItinerariesController < ApplicationController
  before_action :set_product, only: [:show, :intro, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_user, only: [:edit, :update, :destroy]

  def show
    render :layout => 'maze'
  end

  def intro
  end

  def manage_itineraries
    @itineraries = Itinerary.where(user: current_user).order("created_at DESC")
  end

  def edit
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

  def update
    if @itinerary.update(itinerary_params)

      locations = params[:itinerary][:content]

      Itinerary.location_parse_save(locations, @itinerary)

      redirect_to @itinerary, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @itinerary.destroy
    redirect_to itineraries_path, notice: 'Product was successfully destroyed.'
  end


  private

  def set_product
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:content, :title, :description, :neighborhood_id)
  end

  def check_user
    if current_user.id != @itinerary.user_id
      redirect_to root_url, alert: "Sorry, this listing belongs to someone else"
    end
  end

end
