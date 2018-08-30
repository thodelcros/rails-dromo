class Owner::StepsController < ApplicationController
  before_action :set_itinerary, only: [ :create, :update ]

  def create
    @step = Step.new(params_step)
    @step.itinerary = @itinerary
    @step.save
    redirect_to edit_owner_itinerary_path(@itinerary)
  end

  def update
    step = Step.find(params[:id])
    step.update(params_step)

    redirect_to edit_owner_itinerary_path(step.itinerary)
  end

  def destroy
    step = Step.find(params[:id])
    step.destroy

    redirect_to edit_owner_itinerary_path(step.itinerary)
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def params_step
    params.require(:step).permit(:city, :title, :description, :category, :rating)
  end

end
