class Center < ActiveRecord::Base
  attr_accessible :lat, :lng
  belongs_to :surface
end
