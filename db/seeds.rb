# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all the element in the db..."
Workplace.destroy_all
Feature.destroy_all
puts "Done."


@client = GooglePlaces::Client.new(ENV['GOOGLE_PLACE_API'])

coworkings = @client.spots_by_query("coworking montreal")
libraries = @client.spots_by_query("library montral")

puts "Seeding coworking places..."
coworkings.each do |coworking|
  Workplace.create!(google_id: coworking.place_id, name: coworking.name, category: 0, address: coworking.formatted_address, longitude: coworking.lng, latitude: coworking.lat)
end
puts "Done."

puts "Seeding libraries..."
libraries.each do |library|
  Workplace.create!(google_id: library.place_id, name: library.name, category: 1, address: library.formatted_address, longitude: library.lng, latitude: library.lat)
end
puts "Done."

features = ["wifi", "large tables", "hot drinks", "cold drinks", "snacks", "meals", "electric outlets", "private rooms", "hourly rate" ]

puts "Seeding the features..."
features.each do |feature|
  puts Feature.create!(name: feature)
end
puts "Done."

# response = RestClient.get "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{coworking.photos.first.photo_reference
# }&key=#{ENV['GOOGLE_PLACE_API']}"

