# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150129081803) do

  create_table "centers", :force => true do |t|
    t.string   "lat"
    t.string   "lng"
    t.integer  "itinerario_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "surface_id"
  end

  add_index "centers", ["surface_id"], :name => "index_centers_on_surface_id"

  create_table "lonlats", :force => true do |t|
    t.string   "lat"
    t.string   "lon"
    t.integer  "itinerario_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "lonlats", ["itinerario_id"], :name => "index_lonlats_on_itinerario_id"

  create_table "overlays", :force => true do |t|
    t.integer  "itinerario_id"
    t.string   "type"
    t.string   "title"
    t.text     "content"
    t.string   "fillColor"
    t.decimal  "fillOpacity"
    t.string   "strokeColor"
    t.decimal  "strokeOpacity"
    t.integer  "strokeWeight"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "overlays", ["itinerario_id"], :name => "index_overlays_on_itinerario_id"

  create_table "paths", :force => true do |t|
    t.integer  "overlay_id"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "paths", ["overlay_id"], :name => "index_paths_on_overlay_id"

  create_table "strutturas", :force => true do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "nome"
    t.text     "servizi"
    t.string   "telefono"
    t.string   "web"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "surfaces", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
