class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
    	t.string :date

      t.timestamps
    end
  end
end
