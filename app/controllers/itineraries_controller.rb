class ItinerariesController < ApplicationController
  before_action :set_product, only: [:show, :intro, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_user, only: [:edit, :update, :destroy]

  def show
    @favorite = Favorite.new
    render :layout => 'maze'
  end

  def intro
    render :layout => 'maze-intro'

  end

  def manage_itineraries
    @itineraries = Itinerary.where(user: current_user).order("created_at DESC")
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
  end


  def index

    if !params[:neighborhood_id].blank?
      @itineraries = Itinerary.where(neighborhood_id: params[:neighborhood_id]).order("created_at DESC")
    else
      @itineraries = Itinerary.all.order("created_at DESC")
    end


    render :layout => 'maze-intro'
  end

  def new
    @itinerary = Itinerary.new
    render :layout => 'maze-intro'
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

      render :new, :layout => 'maze-intro'

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


  # def create
  #   @review = @reviewable.Review.new review_params
  #   @review.user = current_user
  #   @comment.save
  #   redirect_to maze_intro_path, notice: "Your review was successfully created"
  # end

  private

  def set_product
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params

    params.require(:itinerary).permit(:content, :title, :description, :neighborhood_id, :image)

  end

  def check_user
    if current_user.id != @itinerary.user_id
      redirect_to root_url, alert: "Sorry, this listing belongs to someone else"
    end
  end

  def review_params
    params.require(:review).permit(:body)
  end

end
