class CreateFuncheaps < ActiveRecord::Migration
  def change
    create_table :funcheaps do |t|
        t.text :event_title
        t.text :address
        t.text :date
        t.float :latitude
        t.float :longitude

      t.timestamps
    end
  end
end
