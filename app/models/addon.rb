class Addon < ActiveRecord::Base
  belongs_to :surface
  # attr_accessible :title, :body
end
