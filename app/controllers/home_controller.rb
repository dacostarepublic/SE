class HomeController < ApplicationController
	load_resource :movie
  def index
    @users = User.all
    @movies = Movie.all
    @shuffledMovies = Movie.all.shuffle
    @firstMovie = @shuffledMovies.shift
    @sortedMovies = Movie.all.sort_by {|e| -e.views}
  end
end
