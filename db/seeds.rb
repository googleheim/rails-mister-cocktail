# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'json'

puts "Deleting doses..."
Dose.delete_all

puts "Deleting ingredients..."
Ingredient.delete_all

puts "Deleting cocktails..."
Cocktail.delete_all

puts "Creating ingredients...."

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read
result = JSON.parse(json)
ingredients = result["drinks"]
ingredients.each do |element|
  new_ingredient = Ingredient.create(name: element["strIngredient1"])
end

puts "Done"

