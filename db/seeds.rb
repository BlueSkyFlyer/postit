# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.find_or_create_by_name(name: "Skydiving")
Category.find_or_create_by_name(name: "BASE Jumping")
Category.find_or_create_by_name(name: "Speed Flying")
Category.find_or_create_by_name(name: "Paragliding")
Category.find_or_create_by_name(name: "Hang Gliding")