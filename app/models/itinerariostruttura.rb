class Itinerariostruttura < ActiveRecord::Base
  belongs_to :creator
  belongs_to :itinerario
  belongs_to :struttura
  attr_accessible :creator_id, :itinerario_id, :struttura_id
end
