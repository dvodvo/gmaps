class CreateSurfaces < ActiveRecord::Migration
  def change
    create_table :surfaces do |t|

      t.timestamps
    end
  end
end
