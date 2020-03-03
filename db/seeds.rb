require 'faker'

require "open-uri"

puts 'Cleaning database...'

Article.destroy_all
User.destroy_all
Category.destroy_all

user_1 = User.create!(name: "Laura", email: "laura@gmail.com", password: "123456")
user_2 = User.create!(name: "Katy", email: "katy@gmail.com", password: "123456")
user_3 = User.create!(name: "Meghan", email: "meghan@gmail.com", password: "123456")
user_4 = User.create!(name: "Kendrikc", email: "kendrick@gmail.com", password: "123456")

puts "#{User.count} users created!"

cat_1 = Category.create!(name: "Burning Man")
cat_2 = Category.create!(name: "Sequins")

puts "#{Category.count} categories created!"

article_1 = Article.create!(name: "Supergirl Costume", color: "red", size: "M", material: "leather", price_cents: "5000", state: "new", user: user_1, category: cat_1)
article_2 = Article.create!(name: "Space Cowboy", color: "silver", size: "M", material: "aluminium foil", price_cents: "7000", state: "new", user: user_2, category: cat_1)
article_3 = Article.create!(name: "Burner Suit", color: "multi", size: "XS", material: "multi", price_cents: "1000", state: "worn once", user: user_3, category: cat_2)

puts "#{Article.count} users created!"
