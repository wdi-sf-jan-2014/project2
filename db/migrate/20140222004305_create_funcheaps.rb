class CreateFuncheaps < ActiveRecord::Migration
  def change
    create_table :funcheaps do |t|
    	t.string :event

      t.timestamps
    end
  end
end
