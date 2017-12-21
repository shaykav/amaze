class Itineraries::FavoritesController < ApplicationController

  def create
    Favorite.find_or_create_by(user_id: current_user.id, itinerary_id: params[:itinerary_id])
  end

  def destroy
    Favorite.find(params[:id]).destroy
  end

  def manage_favorites
    @favorites = Favorite.where(user_id: current_user.id, itinerary_id: favorited_itineraries)
  end

end
