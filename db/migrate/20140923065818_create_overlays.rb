class CreateOverlays < ActiveRecord::Migration
  def change
    create_table :overlays do |t|
      t.references :itinerario
      t.string :type
      t.string :title
      t.text :content
      t.string :fillColor
      t.decimal :fillOpacity
      t.string :strokeColor
      t.decimal :strokeOpacity
      t.integer :strokeWeight

      t.timestamps
    end
    add_index :overlays, :itinerario_id
  end
end
