class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_itinerary, only: [:show]

  def index
    @itineraries = Itinerary.where(shared: true)
    if params[:query].present?
      @itineraries = @itineraries.where("country ILIKE ?", "%#{params[:query]}%")
    end

    if params[:duration].present? and params[:duration] != "" and params[:duration] != "all"
      case params[:duration]
      when "1-7"
        @itineraries = @itineraries.where("duration_in_days <= 7")
      when "8-14"
        @itineraries = @itineraries.where("8 <= duration_in_days").where("duration_in_days <= 14")
      when "15-30"
        @itineraries = @itineraries.where("15 <= duration_in_days").where("duration_in_days <= 30")
      when "30+"
        @itineraries = @itineraries.where("30 <= duration_in_days")
      end
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
