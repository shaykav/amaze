# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


wynwood = Neighborhood.find_or_create_by(name: "Wynwood")
brickell = Neighborhood.find_or_create_by(name: "Brickell")
south_beach = Neighborhood.find_or_create_by(name: "South Beach")
downtown_miami = Neighborhood.find_or_create_by(name: "Downtown Miami")
coconut_grove = Neighborhood.find_or_create_by(name: "Coconut Grove")
little_havana = Neighborhood.find_or_create_by(name: "Little Havana")
design_district = Neighborhood.find_or_create_by(name: "Design District")
midtown_miami = Neighborhood.find_or_create_by(name: "Midtown Miami")
little_haiti = Neighborhood.find_or_create_by(name: "Little Haiti")
overtown = Neighborhood.find_or_create_by(name: "Overtown")
