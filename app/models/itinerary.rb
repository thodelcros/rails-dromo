class Itinerary < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :steps

  extend Enumerize

  enumerize :category, in: ['solo', 'couple', 'friends', 'family']
end
