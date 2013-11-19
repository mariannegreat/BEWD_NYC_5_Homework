require_relative 'spotifysearch'
require_relative 'spotify'
require 'rest-client'
require 'json'
require 'open-uri'

puts "Please enter the name of a song or artist."
query = gets.chomp

spotify = SpotifySearch.new.search_for(query)