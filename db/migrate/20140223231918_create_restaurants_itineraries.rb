class CreateRestaurantsItineraries < ActiveRecord::Migration
  def change
    create_table :restaurants_itineraries do |t|
      t.belongs_to :restaurant, index: true
      t.belongs_to :itinerary, index: true

      t.timestamps
    end
  end
end
