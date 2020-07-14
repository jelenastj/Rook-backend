class CreateTripgears < ActiveRecord::Migration[6.0]
  def change
    create_table :tripgears do |t|
      t.integer :trip_id
      t.integer :gear_id

      t.timestamps
    end
  end
end
