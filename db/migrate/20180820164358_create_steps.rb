class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :title
      t.text :description
      t.string :category
      t.references :itinerary, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
