class Owner::PhotosController < ApplicationController
  include CloudinaryHelper

  def index
    @step = Step.find(params[:step_id])
    photos = @step.photos

    photos_details = photos.map.with_index(1) do |photo, index|
      {
        id: photo.id,
        name: "Photo #{index}",
        picture_url: cl_image_path(photo.picture, width: 150, height: 150, crop: :fill),
        deletion_url: owner_photo_path(photo)
      }
    end

    render json: photos_details
  end

  def create
    @step = Step.find(params[:step_id])
    photo = Photo.create(step: @step, picture: params[:picture])

    respond_to do |format|
      format.json do
        render json: { deletion_url: owner_photo_path(photo) }
      end
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy

    render json: {}
  end

  private

  def photo_params
    params.require(:photo).permit(:picture)
  end
end
