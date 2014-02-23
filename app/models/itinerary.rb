class Itinerary < ActiveRecord::Base
  has_many :restaurants_itineraries
  has_many :funcheaps_itineraries
  has_many :restaurants, through: :restaurants_itineraries
  has_many :funcheaps, through: :funcheaps_itineraries
end
