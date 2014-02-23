class Funcheap < ActiveRecord::Base
  has_many :funcheaps_itineraries
  has_many :itineraries, through: :funcheaps_itineraries
end
