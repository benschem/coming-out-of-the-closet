# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require_relative "seed_repo"
require "faker"
require "open-uri"

puts "Cleaning database..."
User.destroy_all # if Rails.en.development
Costume.destroy_all # if Rails.en.development
Booking.destroy_all # if Rails.en.development

User.create!(
  username: "Music Mates",
  email: "music@mates.com",
  password: "123456"
)
puts "Created User: Music Mates, Email: music@mates.com, Password: 123456."

@all_clothes.each do |clothing|
  user = User.create!(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456"
  )
  puts "\n"
  puts "Created User: #{user.username}, Email: #{user.email}, Password: #{user.password}."
  clothing.each do |cos|
    costume = Costume.new(
      name: cos[0],
      description: cos[1],
      price: cos[2],
      clothing: cos[3],
      user: user
    )
    costume.photo.attach(io: File.open(cos[4]), filename: "example", content_type: "image/png")
    costume.save
    puts "Created Costume: #{costume.name}, a #{costume.clothing} for #{costume.user.username}, $#{costume.price}."
  end
end
puts "Done!"
