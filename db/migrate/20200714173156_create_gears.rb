class CreateGears < ActiveRecord::Migration[6.0]
  def change
    create_table :gears do |t|
      t.string :name
      t.string :brand
      t.string :notes
      t.string :geartype
      t.string :url
      t.string :icon
      t.integer :quantity
      t.boolean :retired
      t.integer :user_id
      t.float :weight

      t.timestamps
    end
  end
end
