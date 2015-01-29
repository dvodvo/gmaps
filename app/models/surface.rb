class Surface < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :center
end
