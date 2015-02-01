class Struttura < ActiveRecord::Base
  attr_accessible :address, :lat, :lon, :nome, :master_struttura_id
  
  attr_writer :lonlat

#  geocoded_by :address
#  after_validation :geocode

  before_save do
    if lon != 0 && lat != 0
      self[:lonlat] = "POINT(#{lon} #{lat})"
    else
      self[:lonlat] = nil
    end
  end


end
