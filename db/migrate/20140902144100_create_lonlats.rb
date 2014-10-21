class CreateLonlats < ActiveRecord::Migration
  def change
    create_table :lonlats do |t|
      t.string :lat
      t.string :lon
      t.references :itinerario

      t.timestamps
    end
    add_index :lonlats, :itinerario_id
  end
end
