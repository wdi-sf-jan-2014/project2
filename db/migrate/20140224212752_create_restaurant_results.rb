class CreateRestaurantResults < ActiveRecord::Migration
  def change
    create_table :restaurant_results do |t|
    	t.string :name
    	t.string :address
    	t.string :city
    	t.string :state
      t.string :full_address
    	t.string :phone
    	t.string :website
    	t.string :logo
    	t.string :rating_img
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
