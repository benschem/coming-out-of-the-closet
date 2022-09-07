# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

puts "Cleaning database..."
User.destroy_all # if Rails.en.development
Costume.destroy_all # if Rails.en.development
clothing = ["suit", "costume", "cosplay"]
pic1 = "https://images.fun.com.au/products/33319/1-1/pirate-flag-fortune-teller-costume-for-women-update.jpg"
pic2 = "https://i.redd.it/f5ibms1p43e91.png"
pic3 = "https://www-s.mlo.me/upen/v/2021/202112/20211229/202112291145253525327.jpg"
pic4 = "https://www.aussieblokesclothes.com.au/wp-content/uploads/2022/03/Cosy-Winter-PJs-Sizes-Small-to-7XL-Stone-Polka-Dots.jpg"
pic5 = "https://static.theblacktux.com/products/suits/light-grey-suit/1_161129_TBT_Ecom_Light_Gray_Suit_2_1262_w1_1812x1875.jpg"
photos = [pic1, pic2, pic3, pic4, pic5]

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
    file = URI.open(photos[rand(0..4)])
    costume.photo.attach(io: file, filename: "example", content_type: "image/png")
    costume.save
    puts "Created Costume: #{costume.name}, a #{costume.clothing} for #{costume.user.username} #{costume.price}."
  end
end

puts "Done!"
