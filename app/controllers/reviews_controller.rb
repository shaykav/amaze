class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviewable = Itinerary.find(params[:itinerary_id])
    @review = @reviewable.reviews
    @reviews = Review.all
  end

  def new
  end
end
