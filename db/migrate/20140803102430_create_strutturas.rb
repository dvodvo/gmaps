class CreateStrutturas < ActiveRecord::Migration
  def change
    create_table :strutturas do |t|
      t.decimal  :lat, :precision => 15, :scale => 10
      t.decimal  :lon, :precision => 15, :scale => 10
      t.string   :nome
      t.text     :address
      t.integer  :master_struttura_id

      t.timestamps
    end
  end
end
