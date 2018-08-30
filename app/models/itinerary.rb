class Itinerary < ApplicationRecord
  extend Enumerize

  belongs_to :owner, class_name: "User"

  has_many :steps, dependent: :destroy

  enumerize :category,       in: ['solo', 'couple', 'friends', 'family']
  enumerize :crew,           in: ['solo', 'couple', 'family', 'friends']
  enumerize :transportation, in: ['car', 'bus', 'plane', 'boat', 'hitchhiking', 'motorbike', 'train']
end
