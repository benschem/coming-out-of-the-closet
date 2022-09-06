# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

puts "Cleaning database..."
User.destroy_all # if Rails.en.development
Costume.destroy_all # if Rails.en.development
clothing = ["suit", "costume", "cosplay"]

User.create!(
  username: "Music Mates",
  email: "music@mates.com",
  password: "123456"
)
puts "Created User: Music Mates, Email: music@mates.com, Password: 123456."

5.times do
  user = User.create!(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456"
  )
  puts "\n"
  puts "Created User: #{user.username}, Email: #{user.email}, Password is #{user.password}."
  3.times do
    costume = Costume.create!(
      name: Faker::Superhero.name,
      description: Faker::Quotes::Shakespeare.hamlet_quote,
      price: rand(50..500),
      clothing: clothing.sample,
      user: user
    )
    puts "Created Costume: #{costume.name}, a #{costume.clothing} for #{costume.user.username} #{costume.price}."
  end
end

puts "Done!"
