class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviewable = Itinerary.find(params[:itinerary_id])

    @reviews = Review.all
  end

  def create
    @review = @reviewable.Review.new review_params
    @review.user = current_user
    @comment.save
    redirect_to @reviewable, notice: "Your review was successfully created"


    respond_to do |format|
     if @review.save
       # format.html { redirect_to @review, notice: 'Review was successfully created.' }
       format.html { redirect_to @review.product }
       format.json { render :show, status: :created, location: @review }
     else
       format.html { render :new }
       format.json { render json: @review.errors, status: :unprocessable_entity }
     end
   end

    @review.save
  end

  def new
    @review = Review.new

  end

private

def review_params
  params.require(:review).permit(:body)
end

end
