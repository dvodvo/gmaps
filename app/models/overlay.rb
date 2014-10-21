class Overlay < ActiveRecord::Base
  belongs_to :itinerario
  attr_accessible :content, :fillColor, :fillOpacity, :strokeColor, :strokeOpacity, :strokeWeight, :title, :type
end
