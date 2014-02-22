class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|

      t.timestamps
    end
  end
end
