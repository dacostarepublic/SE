class MoviesController < ApplicationController
	require "net/http"
	
	respond_to :html, :json
	load_and_authorize_resource :movie, :agerestriction, :cine, :seat, :show, :booking
	def index
		@movies = Movie.all
		respond_with(@movies)
	end

	def show
		@movie = Movie.find(params[:id])
		@cine = Cine.find(@movie.cine.id)
		@seats = Seat.find_all_by_cine_id(@movie.cine.id)
		@starring = @movie.starring.split("\n- ")
		@shows = Show.all
		respond_with(@movie)
	end

	def edit
		respond_with(@movie)
	end

	def update
		@movie.update_attributes(params[:movie])
		@movie.save

		@mov = Movie.find(@movie.id)
		if @mov.imdb_code

			response = Net::HTTP.get_response("imdbapi.org", "/?id="+@mov.imdb_code+"&type=json&plot=full&episode=0&lang=en-US&aka=full&release=full&business=0&tech=0")
			p = JSON.parse(response.body)
			if @mov.title == nil
				if p["title"]
					@mov.title = p["title"]
				end
				
			end
			if @mov.rating == nil
				if p["rating"]
					@mov.rating = p["rating"]
				end
				
			end
			if @mov.description == nil
				if p["plot"]
					@mov.description = p["plot"]
				end
				
			end
			if @mov.genres == nil
				if p["genres"]
					@mov.genres = p["genres"]
				end
				
			end
			if @mov.directed_by == nil
				if p["directors"]
					@mov.directed_by= p["directors"]
				end
				
			end
			if @mov.starring == nil
				if p["actors"]
					@mov.starring = p["actors"]
				end
				
			end
			if @mov.agerestriction_id == nil
				if p["rated"]
					@mov.agerestriction_id = Agerestriction.find_by_name(p["rated"]).id
				
				else
					@mov.agerestriction_id = Agerestriction.find_by_name("NOT_RATED").id
				end
			end

			


			if @mov.views == nil
				@mov.views = 0		
			end

			response = Net::HTTP.get_response("api.themoviedb.org", "/2.1/Movie.getImages/en/json/b4326b88d3f51ff64b32eda05911a9e8/" + @mov.imdb_code + "")
			p = JSON.parse(response.body)			
			movieId = p[0]["id"]
			if p[0]["posters"][5]["image"]["url"]
				@mov.poster = URI.parse(p[0]["posters"][5]["image"]["url"])
			end
			if p[0]["backdrops"][3]["image"]["url"]
				@mov.banner = URI.parse(p[0]["backdrops"][3]["image"]["url"])
			end
			response = Net::HTTP.get_response("api.themoviedb.org", "/2.1/Movie.getInfo/en/json/b4326b88d3f51ff64b32eda05911a9e8/" + movieId.to_s + "")
			p = JSON.parse(response.body)
			if @mov.release_date == nil
				if p[0]["released"]
					@mov.release_date = p[0]["released"]
				end
			end
			if @mov.trailer_url == nil
				if p[0]["trailer"]
					@mov.trailer_url = p[0]["trailer"]
				end
			end


			@mov.save
		else
			@mov.destroy
		end
		respond_with(@movie)
	end

	def new
		@movie = Movie.create(params[:movie])
	end

	def create
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		respond_with(@movie)
	end





end
