class Spotify
    def initialize tracks
    	@album = tracks["album"]["name"]
        @released = tracks["album"]["released"]
        @song_name = tracks["name"]
        @artist_name = tracks["artists"][0]["name"]
    end

    def print
        puts "Song: #{@song_name}"
        puts "Artist: #{@artist_name}"
    	puts "Album: #{@album} (#{@released})"
        puts "\n"
    end
end