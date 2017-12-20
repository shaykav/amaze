class ReviewsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_reviewable, only: [:create]

def create
  @review = Review.new(review_params)
  @review.user_id = current_user.id
  @review.save
  redirect_to maze_intro_path(@review.itinerary.id),notice: "Your review was successfully created."

end

private

  def review_params
    params.require(:review).permit(:body, :itinerary_id)
  end

  # def set_reviewable
  #   @reviewable = Itinerary.find(params[:id])
  # end

end
