class SpotifySearch 
	attr_reader :parsed, :query

	API_ENDPOINT = 'http://ws.spotify.com/search/1/track.json'
	
	def search_for(query)
	    @parsed = JSON.parse(RestClient.get(API_ENDPOINT, { params: { q: query }}))
	    show_results(query)
	end

	def show_results(query)
		if @parsed["info"]["num_results"] == 0
			puts "No matches were found!"
			puts "\n"
			puts "Please search again:"
			query = gets.chomp
			search_for(query)
		else 
			puts "\n"
			puts "Your search for \"#{query}\" produced the following results:"
			puts "\n"

			@parsed["tracks"].collect do |tracks|
			    songs = Spotify.new tracks
			    songs.print
			end

			puts "Happy listening!"
			puts "\n"
		end
	end
end