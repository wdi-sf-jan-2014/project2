class RestaurantsItinerary < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :itinerary
end
