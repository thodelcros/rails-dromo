class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_itinerary, only: [:show]

  def index
    if params[:query].present?
      @itineraries = Itinerary.where("country ILIKE ?", "%#{params[:query]}%").where(shared: true)
    else
      @itineraries = Itinerary.where(shared: true)
    end
  end

  def show
    @itinerary_nbr_step = set_itinerary_steps_count
    @steps = @itinerary.steps.order(created_at: :asc).where.not(latitude: nil, longitude: nil)
    @markers = @steps.map.with_index do |step, index|

      {
        lat: step.latitude,
        lng: step.longitude,
        label: {
          text: (index + 1).to_s,
          color: "#011638",
          fontSize: "16px",
          fontWeight: "bold"
        },
        icon: {
          url: "https://res.cloudinary.com/thodelcros/image/upload/v1535377577/pin-active.svg",
          origin: [0, 0],
          labelOrigin: [13,13]
        }
      }
    end
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def set_itinerary_steps_count
    @itinerary.steps.count
  end
end
