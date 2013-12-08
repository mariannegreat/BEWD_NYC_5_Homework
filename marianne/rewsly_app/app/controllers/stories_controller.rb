class StoriesController < ApplicationController
  def index
    @stories = Story.all
    @popular_stories = Story.where(created_at: DateTime.now.beginning_of_day.. DateTime.now.end_of_day)
    @highest_rated = Story.where('upvotes > 3')
  end
  def show
  	@story = Story.find params[:id]
  end
  def new 
  	@story = Story.new
  end
  def create
  		@story = Story.new(safe_story)
  		if @story.save
  			flash[:notice] = "Story added successfully"
  			redirect_to @story
  		else
  			render 'new'
  		end
  	end

  	private

	def safe_story
		params.require(:story).permit(:title, :link, :upvotes, :category)
	end
end