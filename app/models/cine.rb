class Cine < ActiveRecord::Base
	has_many :bookings
	has_many :seats
	belongs_to :movie
  attr_accessible :columns, :movie_id, :rows
end
