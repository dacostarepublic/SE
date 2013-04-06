class Seat < ActiveRecord::Base
	belongs_to :cine
	has_many :bookings
  attr_accessible :cine_id, :column, :level, :row
end
