class AddLonlatToStrutturas < ActiveRecord::Migration
  def change
    add_column :strutturas, :lonlat, :point, :geographic => true
    add_index  :strutturas, :lonlat, using: 'GIST'
  end
end
