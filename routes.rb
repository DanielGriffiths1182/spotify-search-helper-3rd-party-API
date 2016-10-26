require 'sinatra'
require "sinatra/cross_origin"
require_relative 'from_spotify'

register Sinatra::CrossOrigin

configure do
  enable :cross_origin
end

options '/*' do
  response["Access-Control-Allow-Headers"] = "origin, x-requested-with, content-type"
end

# get '/api/average/time/gender/:gender' do
#   avg_time_by_gender = Tests.all.where(gender: params[:gender]).average(:seconds_taken)
#   avg_time_by_gender.to_json
# end

# get '/artists' do
#   particular = search.get(q: params[:name], type: params[:category])
#
#   artists = particular["artists"]
#   artist_first_recall = artists["items"].first
#   artist_first_recall_url = artists["href"]
#
#   artist_name = artist_first_recall["name"]
#   artist_genres = artist_first_recall["genres"][0]
#   artist_followers = artist_first_recall["followers"]["total"]
#   artist_popularity = artist_first_recall["popularity"]
#   artist_image = artist_first_recall["images"].first
#
#   content_type :json
#
#   {
#     url: artist_first_recall_url,
#     name: artist_name,
#     genre: artist_genres
#   }.to_json
# end

get '/api/artist/name' do

end

get '/api/artist/genre' do

end

get '/api/artist/followers' do

end

get '/api/artist/popularity' do

end

get '/api/artist/spotify' do

end

get '/api/artist/image' do

end

get '/api/album/name' do

end

get '/api/album/artist' do

end

get '/api/album/spotify' do

end

get '/api/album/image' do

end

# API: return as json
# Web App: go in a view/template
# class ArtistsController
#   def get
#     particular = search.get(q: name, type: category)
#
#     artists = particular["artists"]
#     artist_first_recall = artists["items"].first
#     artist_first_recall_url = artists["href"]
#
#     artist_name = artist_first_recall["name"]
#     artist_genres = artist_first_recall["genres"][0]
#     artist_followers = artist_first_recall["followers"]["total"]
#     artist_popularity = artist_first_recall["popularity"]
#     artist_image = artist_first_recall["images"].first
#
#     render json: {
#       url: artist_first_recall_url,
#       name: artist_name,
#       genre: artist_genres
#     }
#   end
# end
