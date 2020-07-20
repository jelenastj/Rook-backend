class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.string :notes

      t.timestamps
    end
  end
end
