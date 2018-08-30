class AddDefaultValueToSharedAttribute < ActiveRecord::Migration[5.2]
  def up
    change_column :itineraries, :shared, :boolean, default: false
  end

  def down
    change_column :itineraries, :shared, :boolean, default: nil
  end
end
