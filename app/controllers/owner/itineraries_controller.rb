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
    @itinerary.update(shared: true)

    redirect_to owner_itineraries_path
  end

  def unshare
    @itinerary = Itinerary.find(params[:id])
    @itinerary.update(shared: false)

    redirect_to owner_itineraries_path
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
      redirect_to edit_owner_itinerary_path(@itinerary)
    else
      render :new
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
    @steps = Step.where(itinerary: @itinerary).order(:created_at)

    @step = Step.new
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
    @photo = Photo.new
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:country, :duration_in_days, :transportation, :start_date, :crew)
  end
end
