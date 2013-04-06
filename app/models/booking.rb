class Booking < ActiveRecord::Base
	belongs_to :cine
	belongs_to :user
	belongs_to :seat
	belongs_to :show

	has_one :complaint
  attr_accessible :cine_id, :movie_imdb_code, :user_id, :seat_id, :show_id
end
