class AddItineraryToRestaurants < ActiveRecord::Migration
  def change
    add_reference :restaurants, :itinerary, index: true
  end
end
