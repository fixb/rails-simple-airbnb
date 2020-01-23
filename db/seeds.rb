# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
Flat.destroy_all

puts 'Creating Flats...'
100.times do
  flats_attributes = [
  {
    name:         Faker::FunnyName.unique.two_word_name,
    address:      Faker::Address.full_address,
    description:  Faker::Lorem.unique.paragraph_by_chars(number: 240, supplemental: false),
    price_per_nights: rand(55..350),
    number_of_guests: rand(2..15)
  }
]
Flat.create!(flats_attributes)
end

puts 'Finished!'
