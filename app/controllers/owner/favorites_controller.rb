class Owner::FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites

    @favorites_per_country = current_user.favorites.group_by do |favorite|
      favorite.country
    end

    @countries = []
    @favorites_per_country.each_key { |key| @countries << key }
  end
end
