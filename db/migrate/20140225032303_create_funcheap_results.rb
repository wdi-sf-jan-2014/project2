class CreateFuncheapResults < ActiveRecord::Migration
  def change
    create_table :funcheap_results do |t|
        t.text :name
        t.text :full_address
        t.text :date
        t.string :logo
        t.string :rating_img
        t.float :latitude
        t.float :longitude

      t.timestamps
    end
  end
end
