# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'faker'

open_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
doc = open(open_url).read

JSON.parse(doc)['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient.values.join)
end

c_names = []

20.times do
  name = Faker::Cannabis.brand
  Cocktail.create!(name: name) unless c_names.include? name
  c_names << name
end
