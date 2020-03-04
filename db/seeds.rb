require 'faker'

require "open-uri"

puts 'Cleaning database...'

Article.destroy_all
User.destroy_all
Category.destroy_all

user_1 = User.create!(name: "Laura", email: "laura@gmail.com", password: "123456")
user_2 = User.create!(name: "Katy", email: "katy@gmail.com", password: "123456")
user_3 = User.create!(name: "Meghan", email: "meghan@gmail.com", password: "123456")
user_4 = User.create!(name: "Kendrikc", email: "kendrikc@gmail.com", password: "123456")

puts "#{User.count} users created!"

cat_1 = Category.create!(name: "Burning Man")
cat_2 = Category.create!(name: "Sequins")
cat_3 = Category.create!(name: "Cosplay")

puts "#{Category.count} categories created!"

article_1 = Article.create!(name: "Supergirl Costume", color: "red", size: "M", material: "leather", price_cents: "5000", state: "new", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." , user: user_1, category: cat_2)
article_2 = Article.create!(name: "Space Cowboy", color: "silver", size: "M", material: "aluminium foil", price_cents: "7000", state: "new", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_2, category: cat_1)
article_3 = Article.create!(name: "Burner Suit", color: "multi", size: "XS", material: "multi", price_cents: "1000", state: "worn once", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_3, category: cat_1)
article_4 = Article.create!(name: "Sequin Catsuit", color: "black", size: "S", material: "sequins", price_cents: "20000", state: "worn once", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_1, category: cat_2)
article_4 = Article.create!(name: "Picachu", color: "yellow", size: "XL", material: "cotton", price_cents: "1000", state: "worn once", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_4, category: cat_3)

puts "#{Article.count} articles created!"
