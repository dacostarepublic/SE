class Show < ActiveRecord::Base
	has_many :bookings
  attr_accessible :id, :starts
end
