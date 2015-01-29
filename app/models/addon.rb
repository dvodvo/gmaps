class Addon < ActiveRecord::Base
  belongs_to :surface
  has_many :paths
  # attr_accessible :title, :body
end
