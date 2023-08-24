# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_api_response = URI.open(url).read
parsed_response = JSON.parse(movies_api_response)
results = parsed_response["results"]

results.each do |result|
  title = result.dig("title")
  overview = result["overview"]
  poster_url = result["poster_path"]
  rating = result["vote_avarage"]

  Movie.create!(title: title, overview: overview, poster_url: poster_url, rating: rating)
end
