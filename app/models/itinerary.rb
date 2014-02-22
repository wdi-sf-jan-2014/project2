class Itinerary < ActiveRecord::Base
  has_many :funcheaps :restaurants
end
