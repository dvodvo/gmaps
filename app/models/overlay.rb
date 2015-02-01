class Overlay < ActiveRecord::Base
  belongs_to :itinerario
  attr_accessible :content, :fillColor, :fillOpacity, :strokeColor, :strokeOpacity, :strokeWeight, :title, :gmap_type
end
