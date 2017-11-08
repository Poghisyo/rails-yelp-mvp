# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'

5.times do
  name = Faker::Book.title
  address =  Faker::Address.street_address
  phone_number = Faker::PhoneNumber.phone_number
  category = ["chinese", "italian", "japanese", "french", "belgian"].sample

  a = Restaurant.new({name:name, address:address, phone_number:phone_number, category:category})
  a.save
end

puts "finshed"
