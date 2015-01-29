class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.references :itinerario
      t.string :lat
      t.string :lng

      t.timestamps
    end
    add_index :paths, :itinerario_id
  end
end
