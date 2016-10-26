require 'httparty'
require 'pry'
require 'redis'

class Search
  def get(options = {})
    q = options[:q]
    type = options[:type]

    url = "https://api.spotify.com/v1/search?type=#{type}&q=#{q}"

    HTTParty.get(url).parsed_response
  end
end

search = Search.new

puts "Enter either 'Artist' or 'Album'"
category = gets.chomp

puts "Enter the name"
name = gets.chomp

if category == "Artist"
  ############FOR ARTIST#############
  particular = search.get(q: "#{name}", type: "#{category}")

  artists = particular["artists"]
  artist_first_recall = artists["items"].first
  artist_first_recall_url = artists["href"]

  artist_name = artist_first_recall["name"]
  artist_genres = artist_first_recall["genres"][0]
  artist_followers = artist_first_recall["followers"]["total"]
  artist_popularity = artist_first_recall["popularity"]
  artist_image = artist_first_recall["images"].first

  #######FOR ARTIST##########
  puts "Artist: #{artist_name}."
  puts "Genres: #{artist_genres}."
  puts "Number of followers: #{artist_followers}."
  puts "Popularity score: #{artist_popularity}."
  puts "Spotify URL for #{artist_name}, #{artist_first_recall_url}."
  puts "URL for artist image: #{artist_image}."

end

if category == "Album"
  ###########FOR ALBUM#############
  particular = search.get(q: name, type: category)

  albums = particular["albums"]
  album_first_recall = albums["items"].first
  album_first_recall_url = albums["href"]

  album_artist = album_first_recall["artists"].first["name"]
  album_name = album_first_recall["name"]
  album_image = album_first_recall["images"].first
  ##########FOR ALBUM#########
  puts "Album name: #{album_name}."
  puts "Album artist: #{album_artist}."
  puts "Spotify URL for #{album_name}: #{album_first_recall_url}."
  puts "URL for album image: #{album_image}."
end

binding.pry
