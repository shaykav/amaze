class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def show

  end

  def new
    @favorites = Favorite.new
  end

  def create
    
  end

  def destroy
  end
end
