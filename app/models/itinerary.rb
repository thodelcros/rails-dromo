class Itinerary < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :steps, dependent: :destroy
end
