class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.references :overlay
      t.string :lat
      t.string :lng

      t.timestamps
    end
    add_index :paths, :overlay_id
  end
end
