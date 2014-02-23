class CreateFuncheapsItineraries < ActiveRecord::Migration
  def change
    create_table :funcheaps_itineraries do |t|
      t.belongs_to :funcheap, index: true
      t.belongs_to :itinerary, index: true

      t.timestamps
    end
  end
end
