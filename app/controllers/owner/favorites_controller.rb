class Owner::FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites

    @favorites_per_country = current_user.favorites.group_by do |favorite|
      favorite.country
    end

    @countries = []
    @favorites_per_country.each_key { |key| @countries << key }
  end

  def country
    @country = params[:format]

    @favorites_per_country = current_user.favorites.order(created_at: :asc).group_by do |favorite|
      favorite.country
    end

    @steps = []
    @favorites_per_country[@country].each do |favorite|
      @steps << favorite.step
    end

    @itineraries = @steps.map { |step| step.itinerary }.uniq

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
end
