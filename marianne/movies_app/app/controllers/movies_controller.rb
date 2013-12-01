class MoviesController < ApplicationController
	before_action :find_movie, only: [:show, :edit, :update]

	def index
		@movies = Movie.all
	end

	def all 
		@movies = Movie.all
	end

	def new
  		@movie = Movie.new
  	end

  	def create
  		@movie = Movie.new(movie_ok)
  		if @movie.save
  			redirect_to @movie
  		else
  			render 'new'
  		end
  	end

  	def show 
	end

	def edit 
  	end

  	def update
	  	if @movie.update movie_ok
	  		redirect_to @movie
	  	else
	  		render 'edit'
	  	end
	end

	private

	def movie_ok
		params.require(:movie).permit(:title, :description, :year_released, :rating)
	end

	def find_movie
		@movie = Movie.find params[:id]
	end
end