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
tag_2 = Tag.create!(name: "Mermaid")
tag_3 = Tag.create!(name: "Cosplay")
tag_4 = Tag.create!(name: "Boho Chic")
tag_5 = Tag.create!(name: "Edgy")
tag_6 = Tag.create!(name: "Rave")

puts "#{Tag.count} tags created!"

#cat_photo_1 = URI.open('https://www.opposuits.eu/media/catalog/product/cache/10/image/550x/925f46717e92fbc24a8e2d03b22927e1/o/s/osui-0048_festival_suit_the_fresh_prince_1.jpg')
#cat_1 = Category.create!(name: "Suits")
#cat_1.photo.attach(io: cat_photo_1, filename: 'cat_photo_1.jpg', content_type: 'image/jpg')
#cat_1.save!



catphoto_1 = URI.open('https://i.pinimg.com/564x/a6/89/a1/a689a1f52c30ef13602c715fb37f00c5.jpg')
cat_1 = Category.new(name: "Tops")
cat_1.photo.attach(io: catphoto_1, filename: 'catphoto_1.jpg', content_type: 'image/jpg')
cat_1.save!

catphoto_2 = URI.open('https://i.pinimg.com/564x/da/ec/27/daec277d460fccb9cec340b897208bfb.jpg')
cat_2 = Category.new(name: "Dresses")
cat_2.photo.attach(io: catphoto_2, filename: 'catphoto_2.jpg', content_type: 'image/jpg')
cat_2.save!

catphoto_3 = URI.open('https://i.pinimg.com/564x/7f/75/fb/7f75fb2b64d64c1d26f2e27a2b2d482a.jpg')
cat_3 = Category.new(name: "Bottoms")
cat_3.photo.attach(io: catphoto_3, filename: 'catphoto_3.jpg', content_type: 'image/jpg')
cat_3.save!

catphoto_4 = URI.open('https://i.pinimg.com/564x/46/13/22/461322f5c0c2bbdb953406d33c401d90.jpg')
cat_4 = Category.new(name: "Sets")
cat_4.photo.attach(io: catphoto_4, filename: 'catphoto_4.jpg', content_type: 'image/jpg')
cat_4.save!

catphoto_6 = URI.open('https://i.pinimg.com/564x/98/91/5b/98915b65008e60af7eb3f5424c8a8bdd.jpg')
cat_6 = Category.new(name: "Accessories")
cat_6.photo.attach(io: catphoto_6, filename: 'catphoto_6.jpg', content_type: 'image/jpg')
cat_6.save!

catphoto_9 = URI.open('https://i.pinimg.com/564x/f6/57/02/f657029bada596f2b3c1a67a65de5e5f.jpg')
cat_9 = Category.new(name: "Jackets")
cat_9.photo.attach(io: catphoto_9, filename: 'catphoto_9.jpg', content_type: 'image/jpg')
cat_9.save!


puts "#{Category.count} categories created!"

# article_1_photos = ["url1", "url2", ...]
# article_1 = Article.new(name: "Supergirl Costume", color: "red", size: "M", material: "leather", price_cents: "5000", state: "new", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." , user: user_1, category: cat_2)
# article_1_photos.each_with_index do |url, index|
#   articlephoto_1 = URI.open(url)
#   article_1.photos.attach(io: articlephoto_1, filename: "article_photo_#{index}", content_type: 'image/jpeg')
# end


articlephoto_8 = URI.open('https://i.pinimg.com/564x/c7/db/47/c7db47b20429e6b2c9172572927ad07f.jpg')
article_8 = Article.new(name: "Pink Coachella Outfit", color: "pink", size: "M", material: "multi", price_cents: "10000", state: "New", description: "I am selling this entire outfit I wore last year to a music festival! It's only been worn once, really comfy and I got so many compliments!", user: user_4, category: cat_4)
article_8.photos.attach(io: articlephoto_8, filename: 'articlephoto_8.jpg', content_type: 'image/jpeg')
article_8.save!

ArticleTag.create!(tag: tag_1, article: article_8)

articlephoto_9 = URI.open('https://i.pinimg.com/564x/5d/3f/20/5d3f20f62015c74df7eb32751ac81c44.jpg')
article_9 = Article.new(name: "Fire Harness Set", color: "multi", size: "S", material: "sequins", price_cents: "8800", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_3, category: cat_4)
article_9.photos.attach(io: articlephoto_9, filename: 'articlephoto_9.jpg', content_type: 'image/jpeg')
article_9.save!

ArticleTag.create!(tag: tag_1, article: article_9)

articlephoto_16 = URI.open('https://i.pinimg.com/564x/5f/be/33/5fbe332e0e20b7cd772556f9fe145a3c.jpg')
article_16 = Article.new(name: "Multipattern Jacket", color: "rainbow", size: "XL", material: "cotton", price_cents: "13900", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_2, category: cat_9)
article_16.photos.attach(io: articlephoto_16, filename: 'articlephoto_16.jpg', content_type: 'image/jpeg')
article_16.save!

ArticleTag.create!(tag: tag_1, article: article_16)

articlephoto_10 = URI.open('https://i.pinimg.com/564x/13/36/2f/13362f96a09d523afecd9c89713bb5df.jpg')
article_10 = Article.new(name: "Rave Holographic Top", color: "rainbow", size: "S", material: "mesh", price_cents: "3000", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_2, category: cat_4)
article_10.photos.attach(io: articlephoto_10, filename: 'articlephoto_10.jpg', content_type: 'image/jpeg')
article_10.save!

ArticleTag.create!(tag: tag_1, article: article_10)

articlephoto_11 = URI.open('https://i.pinimg.com/564x/36/7e/b8/367eb8557e4c657833a27cc21cc9d3f7.jpg')
article_11 = Article.new(name: "Beaded Flower Crown", color: "rainbow", size: "S", material: "beads", price_cents: "87000", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_1, category: cat_6)
article_11.photos.attach(io: articlephoto_11, filename: 'articlephoto_11.jpg', content_type: 'image/jpeg')
article_11.save!

ArticleTag.create!(tag: tag_1, article: article_11)

articlephoto_12 = URI.open('https://i.pinimg.com/564x/a6/ec/46/a6ec46b754c7f4631c603063ee8b2724.jpg')
article_12 = Article.new(name: "Indie Embroidered Jacket", color: "rainbow", size: "M", material: "embroidery", price_cents: "16800", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_4, category: cat_9)
article_12.photos.attach(io: articlephoto_12, filename: 'articlephoto_12.jpg', content_type: 'image/jpeg')
article_12.save!

ArticleTag.create!(tag: tag_1, article: article_12)

articlephoto_13 = URI.open('https://i.pinimg.com/564x/e4/77/05/e477057d2889abc2b6cdc8ced64f31f9.jpg')
article_13 = Article.new(name: "Shroom Bralette", color: "Black", size: "S", material: "embroidery", price_cents: "3600", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_3, category: cat_1)
article_13.photos.attach(io: articlephoto_13, filename: 'articlephoto_13.jpg', content_type: 'image/jpeg')
article_13.save!

ArticleTag.create!(tag: tag_1, article: article_13)

articlephoto_22 = URI.open('https://i.pinimg.com/564x/fd/be/9a/fdbe9a32c5f1f4af36550f4f0a9101b9.jpg')
article_22 = Article.new(name: "Tassel Set", color: "Black", size: "M", material: "velvet", price_cents: "5500", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_3, category: cat_4)
article_22.photos.attach(io: articlephoto_22, filename: 'articlephoto_22.jpg', content_type: 'image/jpeg')
article_22.save!

ArticleTag.create!(tag: tag_1, article: article_22)


articlephoto_14 = URI.open('https://i.pinimg.com/564x/6e/a2/78/6ea278df81d19f944cebb2f71fbe19e8.jpg')
article_14 = Article.new(name: "Adidas Hoodie", color: "rainbow", size: "L", material: "cotton", price_cents: "6900", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_1, category: cat_9)
article_14.photos.attach(io: articlephoto_14, filename: 'articlephoto_14.jpg', content_type: 'image/jpeg')
article_14.save!

ArticleTag.create!(tag: tag_1, article: article_14)


articlephoto_15 = URI.open('https://i.pinimg.com/564x/b8/66/d3/b866d39e2d0101b93327f3a46827858a.jpg')
article_15 = Article.new(name: "Jelly Boots", color: "pink", size: "38", material: "transparent", price_cents: "8900", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_4, category: cat_6)
article_15.photos.attach(io: articlephoto_15, filename: 'articlephoto_15.jpg', content_type: 'image/jpeg')
article_15.save!

ArticleTag.create!(tag: tag_1, article: article_15)

articlephoto_17 = URI.open('https://i.pinimg.com/564x/dc/ce/1b/dcce1b791855bcec1018d882bcef474e.jpg')
article_17 = Article.new(name: "Pinstripe Shorts", color: "rainbow", size: "M", material: "denim", price_cents: "4900", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_3, category: cat_3)
article_17.photos.attach(io: articlephoto_17, filename: 'articlephoto_17.jpg', content_type: 'image/jpeg')
article_17.save!

ArticleTag.create!(tag: tag_1, article: article_17)

articlephoto_18 = URI.open('https://i.pinimg.com/564x/d5/69/eb/d569eb53ebf9de86c22d900973c5c32e.jpg')
article_18 = Article.new(name: "Quartz Military Hat", color: "silver", size: "N/A", material: "jewels", price_cents: "8800", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_2, category: cat_6)
article_18.photos.attach(io: articlephoto_18, filename: 'articlephoto_18.jpg', content_type: 'image/jpeg')
article_18.save!

ArticleTag.create!(tag: tag_1, article: article_18)

articlephoto_19 = URI.open('https://i.pinimg.com/564x/06/79/b2/0679b244d13aee0f02808c23f57562f7.jpg')
article_19 = Article.new(name: "Holographic Pants", color: "silver", size: "M", material: "nylon", price_cents: "3500", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_1, category: cat_3)
article_19.photos.attach(io: articlephoto_19, filename: 'articlephoto_19.jpg', content_type: 'image/jpeg')
article_19.save!

ArticleTag.create!(tag: tag_1, article: article_19)

articlephoto_20 = URI.open('https://i.pinimg.com/564x/70/2f/b5/702fb51bf529265ad3d58edd1787fe74.jpg')
article_20 = Article.new(name: "Chained Set", color: "silver", size: "M", material: "metal", price_cents: "22900", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_3, category: cat_4)
article_20.photos.attach(io: articlephoto_20, filename: 'articlephoto_20.jpg', content_type: 'image/jpeg')
article_20.save!

ArticleTag.create!(tag: tag_1, article: article_20)

articlephoto_6 = URI.open('https://i.pinimg.com/564x/07/30/ee/0730ee9a0cd033e70b0419dc1cfb21ef.jpg')
article_6 = Article.new(name: "Rainbow Tassel Cape", color: "rainbow", size: "L", material: "sequins", price_cents: "8600", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_3, category: cat_9)
article_6.photos.attach(io: articlephoto_6, filename: 'articlephoto_6.jpg', content_type: 'image/jpeg')
article_6.save!

ArticleTag.create!(tag: tag_1, article: article_6)

articlephoto_21 = URI.open('https://i.pinimg.com/564x/e1/27/f7/e127f758b2400c72b6cfc47d10bfec49.jpg')
article_21 = Article.new(name: "Kaleidescope Sunglasses", color: "pink", size: "N/A", material: "plastic", price_cents: "2200", state: "New", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_2, category: cat_6)
article_21.photos.attach(io: articlephoto_21, filename: 'articlephoto_21.jpg', content_type: 'image/jpeg')
article_21.save!

ArticleTag.create!(tag: tag_1, article: article_21)

articlephoto_23 = URI.open('https://i.pinimg.com/564x/40/79/1c/40791c76d3d658476162b239bc8cfbaa.jpg')
article_23 = Article.new(name: "Fringed Jean Shorts", color: "blue", size: "N/A", material: "denim", price_cents: "2200", state: "New", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_2, category: cat_3)
article_23.photos.attach(io: articlephoto_23, filename: 'articlephoto_23.jpg', content_type: 'image/jpeg')
article_23.save!

ArticleTag.create!(tag: tag_1, article: article_23)

articlephoto_7 = URI.open('https://i.pinimg.com/564x/74/2e/55/742e555c9f5f2ef73065339db5660636.jpg')
article_7 = Article.new(name: "Blue Sequin Set", color: "blue", size: "S", material: "sequins", price_cents: "6200", state: "Lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_1, category: cat_4)
article_7.photos.attach(io: articlephoto_7, filename: 'articlephoto_7.jpg', content_type: 'image/jpeg')
article_7.save!

ArticleTag.create!(tag: tag_1, article: article_7)

articlephoto_4 = URI.open('https://i.pinimg.com/564x/68/ac/fc/68acfce13772fd483559f6b786ae6263.jpg')
article_4 = Article.new(name: "Rainbow Crochet Set", color: "rainbow", size: "S", material: "crochet", price_cents: "4800", state: "worn once", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_1, category: cat_4)
article_4.photos.attach(io: articlephoto_4, filename: 'articlephoto_4.jpg', content_type: 'image/jpeg')
article_4.save!

ArticleTag.create!(tag: tag_1, article: article_4)


articlephoto_1 = URI.open('https://i.pinimg.com/564x/46/13/22/461322f5c0c2bbdb953406d33c401d90.jpg')
article_1 = Article.new(name: "Silver Beaded Set", color: "silver", size: "M", material: "beads", price_cents: "5000", state: "new", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." , user: user_1, category: cat_4)
article_1.photos.attach(io: articlephoto_1, filename: 'articlephoto_1.jpg', content_type: 'image/jpeg')
article_1.save!

ArticleTag.create!(tag: tag_1, article: article_1)

articlephoto_2 = URI.open('https://i.pinimg.com/564x/97/b1/19/97b119e196eaa813002479a106ab35f4.jpg')
article_2 = Article.new(name: "Rainbow Sequin Romper", color: "rainbow", size: "S", material: "sequins", price_cents: "7000", state: "lightly worn", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_2, category: cat_2)
article_2.photos.attach(io: articlephoto_2, filename: 'articlephoto_2.jpg', content_type: 'image/jpeg')
article_2.save!

ArticleTag.create!(tag: tag_2, article: article_2)

articlephoto_3 = URI.open('https://i.pinimg.com/564x/c0/6d/4b/c06d4b90a8880feb9a7bab46965e236b.jpg')
article_3 = Article.new(name: "Tinsel Jacket", color: "multi", size: "L", material: "tinsel", price_cents: "13500", state: "worn once", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_3, category: cat_9)
article_3.photos.attach(io: articlephoto_3, filename: 'articlephoto_3.jpg', content_type: 'image/jpeg')
article_3.save!

ArticleTag.create!(tag: tag_1, article: article_3)



articlephoto_5 = URI.open('https://i.pinimg.com/564x/e5/9d/a6/e59da6d20751e3c41d5d961ebf444ebf.jpg')
article_5 = Article.new(name: "Jewel Sunglasses", color: "multi", size: "S", material: "jewels", price_cents: "9800", state: "New", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: user_2, category: cat_6)
article_5.photos.attach(io: articlephoto_5, filename: 'articlephoto_5.jpg', content_type: 'image/jpeg')
article_5.save!

ArticleTag.create!(tag: tag_1, article: article_5)



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

