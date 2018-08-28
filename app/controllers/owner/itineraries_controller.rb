class Owner::ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all.where(owner: current_user)
    @nbr_itineraries = @itineraries.count
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def new
    @owner = current_user
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.owner = current_user
    if @itinerary.save
      redirect_to edit_owner_itinerary_path
    else
      render :new
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
    @steps = Step.where(itinerary: @itinerary)

    @step = Step.new
    @markers = @steps.map.with_index do |step, index|
      {
        lat: step.latitude,
        lng: step.longitude,
        label: (index + 1).to_s
      }
    end

    @photo = Photo.new
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:country, :duration_in_days, :transportation, :start_date, :crew)
  end
end
