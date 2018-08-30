class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @latest_itineraries = Itinerary.where(shared: true).last(3)
  end
end
