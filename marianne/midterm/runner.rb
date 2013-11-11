require_relative 'spotify'
require 'rest-client'
require 'json'
require 'open-uri'

puts "Hello, music lover!"
puts "Please enter the name of a song or artist."

query = gets.chomp
url = 'http://ws.spotify.com/search/1/track.json?q='
url += query
jsonURL = URI::encode(url)

result = RestClient.get(jsonURL)
parsed = JSON.parse result

if parsed["info"]["num_results"] == 0
	puts "No matches were found!"
	puts "\n"
else 
	puts "\n"
	puts "Your search for \"#{query}\" produced the following results:"
	puts "\n"

	parsed["tracks"].collect do |tracks|
	    songs = Spotify.new tracks
	    songs.print
	end

	puts "Happy listening!"
	puts "\n"
end
