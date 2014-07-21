# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [
  "Fast Food",
  "Italian",
  "Pub fare",
  "Fine Dining",
  "Pizza",
  "Chinese",
  "Steak"
]

categories.each do |name|
  Category.create(:name => name)
end

Restaurant.create!([
  {name: "360 Restaurant", address: "301 Front St W, Toronto, ON, CANADA", phone: nil, picture: nil, description: "360 The Restaurant at the CN Tower, one of Toronto's finest, features unforgettable food combined with a magnificent revolving view of Toronto more than 351 metres (1,151 ft) below. 360 offers market-fresh cuisine, featuring regional ingredients to ensure an incomparable culinary experience.360 The Restaurant at the CN Tower, one of Toronto's finest, features unforgettable food combined with a magnificent revolving view of Toronto more than 351 metres (1,151 ft) below. 360 offers market-fresh cuisine, featuring regional ingredients to ensure an incomparable culinary experience.", category_id: nil, capacity: 100, latitude: "43.64251", longitude: "-79.387038"},
  {name: "Yuzu No Hana", address: "236 Adelaide Street West, Toronto, ON, Canada", phone: nil, picture: nil, description: "The experience is all about excellent food and drink, enjoyed in a relaxed and welcoming atmosphere.", category_id: nil, capacity: 100, latitude: "43.6483462", longitude: "-79.3883282"},
  {name: "Caribbean Taste", address: "224 Adelaide St W, Toronto, ON, Canada", phone: nil, picture: nil, description: "In the heart of the Financial and Entertainment District Caribbean Taste", category_id: nil, capacity: 100, latitude: "43.6484781", longitude: "-79.3880553"},
  {name: "Grace O'Malleys", address: "14 Duncan St, Toronto, ON, Canada", phone: nil, picture: nil, description: "At Grace O'Malley's the story of Grainne Ni Mhaille, or Granuaile (Anglicized as Grace O'Malley, Grany Malley), reads like the most brazen and unlikely sort of adventure fiction, but thereU+FFE2s history as well as myth in the legend of the Irish noblewoman who led a band of 200 sea-raiders from the coast of Galway in the sixteenth century.", category_id: nil, capacity: 100, latitude: "43.6475947", longitude: "-79.3885237"},
  {name: "Bellwoods Brewery", address: "124 Ossignton Ave, Toronto, ON, Canada", phone: nil, picture: nil, description: "Beer and food", category_id: nil, capacity: 100, latitude: "43.6470566", longitude: "-79.4200648"},
  {name: "Salt Wine bar", address: "225 Ossington Ave, Toronto, ON, Canada", phone: nil, picture: nil, description: "Located at the top of the Ossington strip, Salt wine bar offers a modern progressive approach to Iberian/Canadian tapas. Salt is a bustling, cozy, communal tapas bar with great energy. Our guests enjoy artisanal cheeses, Iberian charcuterie and an excellent variety of small plate dishes. Chef Dave Kemp is strongly committed to using seasonal and local products whenever possible. Our cellar contains an extensive list of Portuguese and Spanish wines which complement each and every dish.", category_id: nil, capacity: 100, latitude: "43.6489828", longitude: "-79.4206365"},
  {name: "Burrito Boyz", address: "218 Adelaide St W, Toronto, ON, Canada", phone: "", picture: nil, description: "Awesome burritos", category_id: nil, capacity: 100, latitude: "43.6485412", longitude: "-79.3877675"},
  {name: "El Caballito", address: "220 King St W, Toronto ON", phone: "123 456 7890", picture: nil, description: "Yummy tequila!", category_id: nil, capacity: 100, latitude: "43.6472581", longitude: "-79.3869509"}
])
