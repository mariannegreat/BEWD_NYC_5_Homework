class StoriesController < ApplicationController
  def index
  	@stories = Story.all
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