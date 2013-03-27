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

fast = Category.where(:name => "Fast Food").first
pizza = Category.where(:name => "Pizza").first

Restaurant.create(
  :name => "Burger King",
  :address => "180 Wellington St",
  :phone => "555-1212",
  :description => "Whoppers!",
  :category => fast
)

Restaurant.create(
  :name => "McDonalds",
  :address => "277 Front St W",
  :phone => "555-1212",
  :description => "Big Macs!",
  :category => fast
)

Restaurant.create(
  :name => "Pizza Pizza",
  :address => "599 Queen St W",
  :phone => "967-1111",
  :description => "Chewy pizzas!",
  :category => pizza
)

Restaurant.create(
  :name => "Dominos",
  :address => "329832 Steeles Ave W",
  :phone => "333-3333",
  :description => "Greasy pizzas!",
  :category => pizza
)


