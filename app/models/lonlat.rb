class Lonlat < ActiveRecord::Base
  belongs_to :itinerario
  attr_accessible :lat, :lon, :itinerario_id
end
