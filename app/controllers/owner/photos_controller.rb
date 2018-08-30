class Owner::PhotosController < ApplicationController
  def create
    @step = Step.find(params[:step_id])
    # photo = Photo.new(photo_params)
    # photo.step = step

    # photo.save
    # redirect_to edit_owner_itinerary_path(step.itinerary)

    respond_to do |format|
      format.json do
        @photo = Photo.create(step: @step, picture: params[:picture])
        render json: { deletionUrl: owner_photo_path(@photo) }
      end
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    itinerary = photo.step.itinerary

    photo.destroy

    respond_to do |format|
      format.json do
        render json: {}
      end

      format.js
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:picture)
  end
end
