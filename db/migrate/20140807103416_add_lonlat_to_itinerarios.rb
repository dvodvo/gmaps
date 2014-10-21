class AddLonlatToItinerarios < ActiveRecord::Migration
  def change
    add_column :itinerarios, :lonlat_center, :point, :geographic => true
    add_column :itinerarios, :zoom_level, :integer
    
    add_index  :itinerarios, :lonlat_center, using: 'GIST'
  end
end
