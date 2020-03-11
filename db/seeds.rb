require "open-uri"

puts 'Cleaning database...'

Review.destroy_all
ArticleTag.destroy_all
Tag.destroy_all
Order.destroy_all
Article.destroy_all
User.destroy_all
Category.destroy_all


userphoto_1 = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1578927204/z37gkiugtzu0smpt6jpf.jpg')
user_1 = User.new(name: "Katy", email: "katy@gmail.com", password: "123456")
user_1.photo.attach(io: userphoto_1, filename: 'userphoto_1.jpg', content_type: 'image/jpg')
user_1.save!

userphoto_2 = URI.open('https://avatars2.githubusercontent.com/u/58662021?v=4')
user_2 = User.new(name: "Laura", email: "laura@gmail.com", password: "123456")
user_2.photo.attach(io: userphoto_2, filename: 'userphoto_2.jpeg', content_type: 'image/jpeg' )
user_2.save!

userphoto_3 = URI.open('https://avatars1.githubusercontent.com/u/59030202?v=4')
user_3 = User.new(name: "Meghan", email: "meghan@gmail.com", password: "123456")
user_3.photo.attach(io: userphoto_3, filename: 'userphoto_3.jpeg', content_type: 'image/jpeg' )
user_3.save!

userphoto_4 = URI.open('https://www.biography.com/.image/t_share/MTU0OTkwNDUxOTQ5MDUzNDQ3/kanye-west-attends-the-christian-dior-show-as-part-of-the-paris-fashion-week-womenswear-fall-winter-2015-2016-on-march-6-2015-in-paris-france-photo-by-dominique-charriau-wireimage-square.jpg')
user_4 = User.new(name: "Kendrikc", email: "kendrikc@gmail.com", password: "123456")
user_4.photo.attach(io: userphoto_4, filename: 'userphoto_4.jpg', content_type: 'image/jpg')
user_4.save!


puts "#{User.count} users created!"

tag_1 = Tag.create!(name: "Burning Man")
tag_2 = Tag.create!(name: "Sequins")
tag_3 = Tag.create!(name: "Cosplay")

puts "#{Tag.count} tags created!"

#cat_photo_1 = URI.open('https://www.opposuits.eu/media/catalog/product/cache/10/image/550x/925f46717e92fbc24a8e2d03b22927e1/o/s/osui-0048_festival_suit_the_fresh_prince_1.jpg')
#cat_1 = Category.create!(name: "Suits")
#cat_1.photo.attach(io: cat_photo_1, filename: 'cat_photo_1.jpg', content_type: 'image/jpg')
#cat_1.save!


cat_1 = Category.create!(name: "Tops")
cat_2 = Category.create!(name: "Dresses")
cat_3 = Category.create!(name: "Bottoms")
cat_4 = Category.create!(name: "Full Outfits")
cat_5 = Category.create!(name: "Shoes")
cat_6 = Category.create!(name: "Accessories")
cat_7 = Category.create!(name: "Onesies")
cat_8 = Category.create!(name: "Swim")


puts "#{Category.count} categories created!"

# article_1_photos = ["url1", "url2", ...]
# article_1 = Article.new(name: "Supergirl Costume", color: "red", size: "M", material: "leather", price_cents: "5000", state: "new", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." , user: user_1, category: cat_2)
# article_1_photos.each_with_index do |url, index|
#   articlephoto_1 = URI.open(url)
#   article_1.photos.attach(io: articlephoto_1, filename: "article_photo_#{index}", content_type: 'image/jpeg')
# end

articlephoto_1 = URI.open('https://images.unsplash.com/photo-1579891482727-f2f7212c9932?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
article_1 = Article.new(name: "Supergirl Costume", color: "red", size: "M", material: "leather", price_cents: "5000", state: "new", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." , user: user_1, category: cat_2)
article_1.photos.attach(io: articlephoto_1, filename: 'articlephoto_1.jpg', content_type: 'image/jpeg')
article_1.save!

ArticleTag.create!(tag: tag_1, article: article_1)

articlephoto_2 = URI.open('https://images.unsplash.com/flagged/photo-1563831175532-76e760e1d291?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80')
article_2 = Article.new(name: "Space Cowboy", color: "silver", size: "M", material: "aluminium foil", price_cents: "7000", state: "new", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_2, category: cat_1)
article_2.photos.attach(io: articlephoto_2, filename: 'articlephoto_2.jpg', content_type: 'image/jpeg')
article_2.save!

ArticleTag.create!(tag: tag_1, article: article_2)
ArticleTag.create!(tag: tag_2, article: article_2)

articlephoto_3 = URI.open('https://images.unsplash.com/photo-1516637507947-8b085d127dbe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
article_3 = Article.new(name: "Burner Suit", color: "multi", size: "XS", material: "multi", price_cents: "1000", state: "worn once", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_3, category: cat_1)
article_3.photos.attach(io: articlephoto_3, filename: 'articlephoto_3.jpg', content_type: 'image/jpeg')
article_3.save!

ArticleTag.create!(tag: tag_1, article: article_3)

articlephoto_4 = URI.open('https://images.unsplash.com/photo-1515214959832-bf85f5724df1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=694&q=80')
article_4 = Article.new(name: "Sequin Catsuit", color: "black", size: "S", material: "sequins", price_cents: "20000", state: "worn once", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_1, category: cat_2)
article_4.photos.attach(io: articlephoto_4, filename: 'articlephoto_4.jpg', content_type: 'image/jpeg')
article_4.save!

ArticleTag.create!(tag: tag_3, article: article_4)

articlephoto_5 = URI.open('https://images.unsplash.com/photo-1529143732233-da7fb74682a3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80')
article_5 = Article.new(name: "Pikachu", color: "yellow", size: "XL", material: "cotton", price_cents: "1000", state: "worn once", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_4, category: cat_3)
article_5.photos.attach(io: articlephoto_5, filename: 'articlephoto_5.jpg', content_type: 'image/jpeg')
article_5.save!

ArticleTag.create!(tag: tag_2, article: article_5)


puts "#{Article.count} articles created!"

order_1 = Order.create!(amount_cents: 1000, article: article_3, user: user_4)
order_2 = Order.create!(amount_cents: 6000, article: article_2, user: user_1)
order_3 = Order.create!(amount_cents: 9000, article: article_1, user: user_2)
order_4 = Order.create!(amount_cents: 9000, article: article_5, user: user_3)

puts "#{Order.count} orders created!"

review_1 = Review.create!(content: "Really reliable seller, I would recommend to anyone! I can't wait to wear this to my next festival", rating: 5, order: order_1, user: order_1.user)
review_2 = Review.create!(content: "Everything good, no complaints", rating: 4, order: order_2, user: order_2.user)
review_3 = Review.create!(content: "Really reliable seller, I would recommend to anyone! I can't wait to wear this to my next festival", rating: 5, order: order_3, user: order_3.user)
review_3 = Review.create!(content: "I love it!!! Thank you so much!", rating: 5, order: order_4, user: order_4.user)

puts "#{Review.count} reviews created!"

