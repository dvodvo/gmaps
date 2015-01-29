class Path < ActiveRecord::Base
  belongs_to :overlay
  belongs_to :addon
  attr_accessible :lat, :lng
end
