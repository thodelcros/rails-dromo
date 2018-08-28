class Owner::ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all.where(owner: current_user)
    @nbr_itineraries = @itineraries.count
  end

  def new
  end

end
