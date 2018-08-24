class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new()
    @favorite.user = current_user
    @step = Step.find(params["step_id"].to_i)
    @favorite.step = @step

    @favorite.save

    respond_to do |format|
      format.html { redirect_to itinerary_path(@favorite.step.itinerary) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def destroy
    @favorite = Favorite.find(params["id"].to_i)
    @step = @favorite.step

    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to itinerary_path(@favorite.step.itinerary) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

end
