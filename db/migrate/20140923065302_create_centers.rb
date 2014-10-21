class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|
      t.string :lat
      t.string :lng
      t.references :itinerario

      t.timestamps
    end
  end
end
