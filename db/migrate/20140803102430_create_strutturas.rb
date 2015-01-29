class CreateStrutturas < ActiveRecord::Migration
  def change
    create_table :strutturas do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :nome
      t.integer :master_struttura_id

      t.timestamps
    end
  end
end
