class Step < ApplicationRecord
  belongs_to :itinerary
  has_many :photos
end
