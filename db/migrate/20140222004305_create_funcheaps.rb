class CreateFuncheaps < ActiveRecord::Migration
  def change
    create_table :funcheaps do |t|

      t.timestamps
    end
  end
end
