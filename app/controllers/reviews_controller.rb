class ReviewsController < ApplicationController
  def index
    @reviewable = Itinerary.find(params[:itinerary_id])
  
    @reviews = Review.all
  end

  def create
    @review = Review.new
  end

  def new
  end
end
