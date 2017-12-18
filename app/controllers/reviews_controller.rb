class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviewable = Itinerary.find(params[:itinerary_id])

    @reviews = Review.all
  end

  def create
    @review = Review.new(params[:review])
    @review.save
  end

  def new
  end

private

def review_params
  params.require(:review).permit(:name, :review, :itnerary_id)

end

end
