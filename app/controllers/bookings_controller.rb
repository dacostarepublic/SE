class BookingsController < ApplicationController
	load_and_authorize_resource :booking
	def create
		@booking = Booking.new(params[:booking])
		@booking.user_id = current_user.id
		@booking.cine_id = @cine.id
		@booking.movie_imdb_code = @cine.movie.imdb_code
		@booking.seat_id = @seat.id
		@booking.show_id = @show.id
		if @post.save
			flash[:success] = @cine.movie.title + " has been booked!"
			redirect_to root_path
		end
	end

	def new
		
	end

  	def index
  		@bookings = Booking.find_all_by_user_id(current_user.id)
  		@bookingsAdmin = Booking.all
  	end

  	def tester
  		puts 'hello'
  	end

end
