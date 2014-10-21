class Path < ActiveRecord::Base
  belongs_to :overlay
  attr_accessible :lat, :lng
end
