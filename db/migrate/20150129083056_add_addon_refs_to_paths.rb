class AddAddonRefsToPaths < ActiveRecord::Migration
  def change
    add_column :paths, :addon_id, :integer
    add_index :paths, :addon_id
  end
end
