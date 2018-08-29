class Owner::ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all.where(owner: current_user)
    @nbr_itineraries = @itineraries.count
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])

    @itinerary.destroy

    respond_to do |format|
      format.html { redirect_to owner_itineraries_path }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def share
    @itinerary = Itinerary.find(params[:id])

    @itinerary.shared = true

    redirect_to owner_itineraries_path
  end
end
