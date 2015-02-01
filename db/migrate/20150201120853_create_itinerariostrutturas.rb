class CreateItinerariostrutturas < ActiveRecord::Migration
  def change
    create_table :itinerariostrutturas do |t|
      t.integer :itinerario_id
      t.integer :struttura_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
