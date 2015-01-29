class Path < ActiveRecord::Base
  belongs_to :overlay
  belongs_to :itinerario
  attr_accessible :lat, :lng
end
