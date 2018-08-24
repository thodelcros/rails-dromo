class Owner::FavoritesController < ApplicationController
  def index
    @itineraries = Itinerary.all.where(owner: current_user)
    @itineraries_count = @itineraries.count
    @countries_list = @itineraries.map(&:country).uniq
  end
end
