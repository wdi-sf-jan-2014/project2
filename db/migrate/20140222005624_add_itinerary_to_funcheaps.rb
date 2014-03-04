class AddItineraryToFuncheaps < ActiveRecord::Migration
  def change
    add_reference :funcheaps, :itinerary, index: true
  end
end
