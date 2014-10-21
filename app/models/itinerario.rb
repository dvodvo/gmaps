class Itinerario < ActiveRecord::Base
  has_many :lonlats
  has_one  :center
  has_one  :overlay
  has_many :paths, through: :overlay
  serialize :map_from_json, JSON
  attr_accessible :nome, :lonlat_center, :center_lat, :center_lon, :tilt, :map_type_id, :map_from_json, :zoom
  accepts_nested_attributes_for :center, :allow_destroy => true
  accepts_nested_attributes_for :overlay, :allow_destroy => true
  accepts_nested_attributes_for :paths, :allow_destroy => true
end
