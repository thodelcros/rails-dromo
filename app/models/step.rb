class Step < ApplicationRecord
  # à décommenter quand tu fais le setup de geocoder
  geocoded_by :city_with_country
  after_validation :geocode

  extend Enumerize

  belongs_to :itinerary
  has_many :photos, dependent: :destroy

  # accepts_nested_attributes_for :photos

  enumerize :category, in: ['food', 'nature', 'sport', 'party', 'housing', 'vantage point']

  has_many :favorites, dependent: :destroy

  # Step.category.values # if you need access to the list in the view for instance, for a select input


  # à décommenter quand tu fais le setup de geocoder
 def city_with_country
   "#{self.city}, #{self.itinerary.country}"  # => "Buenos Aires, Argentina"
  end
end
