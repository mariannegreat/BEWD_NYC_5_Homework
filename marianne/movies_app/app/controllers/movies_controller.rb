class MoviesController < ApplicationController
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
  		@movie = Movie.new(params.require(:movie).permit(:title, :description, :year_released, :rating))
  		if @movie.save
  			redirect_to @movie
  		else
  			render 'new'
  		end
  	end

  	def show 
		@movie = Movie.find params[:id]
	end

	def edit 
  		@movie = Movie.find params[:id]
  	end

  	def update
	  	@movie = Movie.find params[:id]
	  	movie_ok = params.require(:movie).permit(:title, :description, :year_released, :rating)
	  	if @movie.update movie_ok
	  		redirect_to @movie
	  	else
	  		render 'edit'
	  	end
	  end
end