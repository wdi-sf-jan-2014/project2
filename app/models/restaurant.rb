class Restaurant < ActiveRecord::Base
  has_many :restaurants_itineraries
  has_many :itineraries, through: :restaurants_itineraries
end
