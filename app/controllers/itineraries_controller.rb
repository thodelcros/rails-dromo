class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_itinerary, only: [:show]

  def index
    if params[:query].present?
      @itineraries = Itinerary.where("country ILIKE ?", "%#{params[:query]}%")
    else
      @itineraries = Itinerary.all
    end
  end

  def show
    @steps = @itinerary.steps.where.not(latitude: nil, longitude: nil)

    @markers = @steps.map do |step|
      {
        lat: step.latitude,
        lng: step.longitude
      }
    end
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end
end
