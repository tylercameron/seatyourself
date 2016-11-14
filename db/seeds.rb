# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create(
  name: 'Figo',
  description: 'FIGO offers Italian inspired cuisine in a stylishly elegant setting. Using the freshest and finest ingredients, Executive Chef Anna Chen brings her own distinctive take on Italian cuisine using contemporary techniques. The menu features house-made ricotta, wood-fired pizzas, and made-from-scratch pastas. At FIGO, our approach is simple; source the best ingredients possible and prepare them in an uncomplicated and modern way.',
  cuisine: 'Italian',
  price: '$$$$',
  street_address: '295 Adelaide Street W.',
  neighbourhood: 'Entertainment District',
  phone: 7483446,
  image: 'figo.jpg',
  capacity: 100
)

Restaurant.create(
  name: 'Campechano Taqueria',
  description: 'Owners Raena Fisher and Daniel Roe hail from Toronto favorites the Black Hoof and La Carnita.',
  cuisine: 'Mexican',
  price: '$$',
  street_address: '504 Adelaide St W',
  neighbourhood: 'Entertainment District',
  phone: 7772800,
  image: 'campechano.jpg',
  capacity: 75
)

Restaurant.create(
  name: 'Maman',
  description: "Maman serves family-inspired recipes, bringing to life childhood favourites, both savoury and sweet, from the South of France and North America. The dishes focus on the highese quality, locally sourced ingredients and highlight Chef Arnal's classic French technique.",
  cuisine: 'French',
  price: '$$',
  street_address: '1 First Canadian Place',
  neighbourhood: 'Financial District',
  phone: 2166767,
  image: 'maman.jpg',
  capacity: 100
)

Restaurant.create(
  name: 'Recess',
  description: 'From the creators of Old School, Recess is a 24 hour diner with a lengthy, delicious breakfast menu.',
  cuisine: 'American',
  price: '$$',
  street_address: '60 Sudbury St.',
  neighbourhood: 'Liberty Village',
  phone: 5852525,
  image: 'recess.jpg',
  capacity: 200
)

Restaurant.create(
  name: 'Hanmoto',
  description: 'Japanese-style snacks & drinks are served at this bare-bones izakaya with flea market decor.',
  cuisine: 'Japanese',
  price: '$',
  street_address: '2 Lakeview Ave',
  neighbourhood: 'Dundas West',
  phone: 8888888,
  image: 'hanmoto.jpg',
  capacity: 250
)

Restaurant.create(
  name: 'Cafeteria',
  description: 'Decorated with quirky vintage finds, this hip outpost serves creative Mexican dishes plus cocktails.',
  cuisine: 'Mexican',
  price: '$$',
  street_address: '974 College St.',
  neighbourhood: 'Downtown',
  phone: 7484777,
  image: 'cafeteria.jpg',
  capacity: 150
)

Restaurant.create(
  name: 'Honest Weight',
  description: 'Even if you don’t hang out in the Junction, there’s a good chance you’ve had Honest Weight’s seafood before. In the year and a half since it opened, John Bil and Victoria Bazan’s eatery/fishmonger’s has begun supplying local restaurants (including Chabrol and Ufficio) with responsibly sourced seafood.',
  cuisine: 'Seafood',
  price: '$$$',
  street_address: '2766 Dundas W',
  neighbourhood: 'Dundas West',
  phone: 6049992,
  image: 'honestweight.jpg'
)

Restaurant.create(
  name: 'Commodore',
  description: 'Under an elegant curved ceiling that (subtly) evokes a ship’s hull, festooned with round glowing lights that (subtly) recall massive barnacles, diners can dive into a menu of carefully considered, labour-intensive dishes that, naturally, put seafood front and centre.',
  cuisine: 'Seafood',
  price: '$$',
  street_address: '1265 Queen Street West',
  neighbourhood: 'Parkdale',
  phone: 5371265,
  image: 'commodore.jpg'
)

Restaurant.create(
  name: 'Artisan Noodle',
  description: 'Artisan Noodle is where those in the know go for Shaanxi-style (Northwestern) Chinese cuisine in North York including authentic versions of the noodles and buns the cuisine is well-known for.',
  cuisine: 'Chinese',
  price: '$$',
  street_address: '5421 Yonge St',
  neighbourhood: 'Downtown',
  phone: 3451155,
  image: 'artisannoodle.jpg'
)

Restaurant.create(
  name: 'Dandylion',
  description: 'A new, “vegetable-forward” spot on Queen Street West from the veteran city chef Jay Carter, feels as though it was conceived as an antidote to the modern restaurant.',
  cuisine: 'Canadian',
  price: '$$',
  street_address: '1198 Queen Street West',
  neighbourhood: 'Queen Street West',
  phone: 4649100,
  image: 'dandylion.jpg'
)
