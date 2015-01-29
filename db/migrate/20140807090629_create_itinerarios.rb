class CreateItinerarios < ActiveRecord::Migration
  def change
    create_table :itinerarios do |t|
      t.string  :nome
      t.integer :zoom
      t.string  :tilt
      t.string  :map_type_id
      t.text    :map_from_json

      t.timestamps
    end
  end
end
