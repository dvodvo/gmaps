class CreateAddons < ActiveRecord::Migration
  def change
    create_table :addons do |t|
      t.references :surface

      t.timestamps
    end
    add_index :addons, :surface_id
  end
end
