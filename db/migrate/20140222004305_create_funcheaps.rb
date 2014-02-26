class CreateFuncheaps < ActiveRecord::Migration
  def change
    create_table :funcheaps do |t|
        t.text :name
        t.text :full_address
        t.text :date
        t.float :latitude
        t.float :longitude

      t.timestamps
    end
  end
end
