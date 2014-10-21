class Struttura < ActiveRecord::Base
  has_many :lonlats
  attr_accessible :address, :latitude, :longitude, :nome, :servizi, :telefono, :web

  geocoded_by :address
  after_validation :geocode

end
