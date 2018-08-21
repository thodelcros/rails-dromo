class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.integer :duration_in_days
      t.string :transportation
      t.string :country
      t.boolean :shared
      t.date :start_date
      t.string :crew
      t.integer :owner_id

      t.timestamps
    end
    add_foreign_key :itineraries, :users, column: :owner_id
    add_index :itineraries, :owner_id
  end
end
