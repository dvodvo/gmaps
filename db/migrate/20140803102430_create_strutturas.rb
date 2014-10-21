class CreateStrutturas < ActiveRecord::Migration
  def change
    create_table :strutturas do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :nome
      t.text :servizi
      t.string :telefono
      t.string :web
      t.string :address

      t.timestamps
    end
  end
end
