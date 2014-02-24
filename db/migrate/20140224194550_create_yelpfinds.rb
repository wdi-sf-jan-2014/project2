class CreateYelpfinds < ActiveRecord::Migration
  def change
    create_table :yelpfinds do |t|
    	t.string :searchterm
    	t.string :address
    	t.string :city
    	t.string :state
    	t.integer :zipcode
    	t.integer :searchradius
    	t.integer :resultslimit

      t.timestamps
    end
  end
end
