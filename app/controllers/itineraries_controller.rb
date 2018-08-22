class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_itinerary, only: [:show]

  def index
    @itineraries = Itinerary.all
  end

  def show
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end
end
