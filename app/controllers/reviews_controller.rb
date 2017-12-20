class ReviewsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_reviewable, only: [:create]

def create
  @review = Review.new(review_params)
  @review.user_id = current_user.id
  @review.save
  redirect_to maze_intro_path(@review.itinerary.id),notice: "Your review was successfully created."

end

def edit
  @review = Review.find(params[:id])
end

def update
  @review = Review.find(params[:id])

  if @review.update_attributes(params_review)
    redirect_to maze_intro_path(@review.itinerary.id)
  else
    render "edit"
  end
end


def destroy
  @review = Review.find(params[:id])
  @review.destroy
  redirect_to maze_intro_path(@review.itinerary.id)
end

private

  def review_params
    params.require(:review).permit(:body, :itinerary_id)
  end

  def params_review
    params.require(:review).permit(:body)
  end
  # def set_reviewable
  #   @reviewable = Itinerary.find(params[:id])
  # end

end
