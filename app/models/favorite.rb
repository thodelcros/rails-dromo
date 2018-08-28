class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :step

  def country
    self.step.itinerary.country
  end
end
