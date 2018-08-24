class Owner::FavoritesController < ApplicationController
  def index
    @itineraries = Itinerary.all.where(owner: current_user)
    @itineraries_count = @itineraries.count
    @countries_list = @itineraries.map(&:country).uniq
  end

  def create
    @favorite = Favorite.new()
    @favorite.user = current_user
    @favorite.step = params[:step_id]
  end
end
