puts "Destroying all the elements in the db..."
Workplace.destroy_all
Feature.destroy_all
puts "Done."

features = [{name: "Wifi", icon: "feature_icon_2.png"}, {name: "Large tables", icon:"feature_icon_4.png"}, {name:"Hot drinks", icon:"feature_icon_1.png"}, {name:"Cold drinks", icon:"feature_icon_3.png"}, {name:"Snacks", icon:"feature_icon_7.png"}, {name:"Meals", icon:"feature_icon_6.png"}, {name:"Electric outlets", icon:"feature_icon_5.png"}, {name:"Private rooms", icon:"feature_icon_8.png"}, {name:"Hourly rate", icon:"feature_icon_9.png"} ]

puts "Seeding the features..."
features.each do |feature|
  Feature.create!(name: feature[:name], icon: feature[:icon])
end
puts "Done."

@client = GooglePlaces::Client.new(ENV['GOOGLE_PLACE_API'])

coworkings = @client.spots_by_query("coworking montreal")
libraries = @client.spots_by_query("library montreal")
coffees = @client.spots_by_query("coffee montreal workplace") + @client.spots_by_query("coffee montreal students")

puts "Seeding coworking places..."
coworkings.each do |coworking|
  workplace = Workplace.create!(google_id: coworking.place_id, name: coworking.name, category: 0, address: coworking.formatted_address, longitude: coworking.lng, latitude: coworking.lat, photo: "la_gare.jpg")
  3.times do
    Workplacefeature.create!(workplace: workplace, feature: Feature.order("RANDOM()").first)
  end
end
puts "Done."

puts "Seeding libraries..."
libraries.each do |library|
  workplace = Workplace.create!(google_id: library.place_id, name: library.name, category: 1, address: library.formatted_address, longitude: library.lng, latitude: library.lat, photo: "banq.jpg")
  3.times do
    Workplacefeature.create!(workplace: workplace, feature: Feature.order("RANDOM()").first)
  end
end
puts "Done."

puts "Seeding coffees..."
coffees.each do |coffee|
  workplace = Workplace.create!(google_id: coffee.place_id, name: coffee.name, category: 2, address: coffee.formatted_address, longitude: coffee.lng, latitude: coffee.lat, photo: "caravane.jpg")
  3.times do
    Workplacefeature.create!(workplace: workplace, feature: Feature.order("RANDOM()").first)
  end
end
puts "Done"

# response = RestClient.get "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{coworking.photos.first.photo_reference
# }&key=#{ENV['GOOGLE_PLACE_API']}"

