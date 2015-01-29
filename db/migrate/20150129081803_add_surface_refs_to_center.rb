class AddSurfaceRefsToCenter < ActiveRecord::Migration
  def change
    add_column :centers, :surface_id, :integer
    add_index :centers, :surface_id
  end
end
